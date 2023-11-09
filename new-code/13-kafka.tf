########################################################################################
# zookeeper-operator
resource "helm_release" "zookeeper-operator" {
  name       = "zookeeper-operator"
  chart      = "./kafka/zookeeper-operator"
  wait       = true
  namespace  = "kb"
  timeout    = 660
  depends_on = [helm_release.keycloak]

}

resource "null_resource" "wait_for_zookeeper-operator" {
  provisioner "local-exec" {
    command = "bash ./wait_for_zookeeper_operator.sh"
  }
  depends_on = [helm_release.zookeeper-operator]
}
########################################################################################
# kafka-operator
resource "helm_release" "kafka-operator" {
  name       = "kafka-operator"
  chart      = "./kafka/kafka-operator"
  wait       = true
  namespace  = "kb"
  timeout    = 660
  depends_on = [null_resource.wait_for_zookeeper-operator]
}

resource "null_resource" "wait_for_kafka-operator" {
  provisioner "local-exec" {
    command = "bash ./wait_for_kafka_operator.sh"
  }
  depends_on = [helm_release.kafka-operator]
}
########################################################################################
# Kafka client
resource "null_resource" "kafka-client" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./kafka/00-kafka-client.yaml -n kb"
  }
  depends_on = [null_resource.wait_for_kafka-operator]
}

resource "null_resource" "wait_for_kafka_client" {
  provisioner "local-exec" {
    command = "bash ./wait_for_kafka_client.sh"
  }
  depends_on = [null_resource.kafka-client]
}
########################################################################################
# Zookeeper
resource "null_resource" "zookeeper" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./kafka/01-zookeeper.yml -n kb"
  }
  depends_on = [null_resource.wait_for_kafka_client]
}

resource "null_resource" "wait_for_zookeeper" {
  provisioner "local-exec" {
    command = "bash ./wait_for_zookeeper.sh"
  }
  depends_on = [null_resource.zookeeper]
}
#####################################################################################
# Kafka cluster
resource "null_resource" "kafkacluster" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./kafka/10-kafkacluster.yaml -n kb"
  }
  depends_on = [null_resource.wait_for_zookeeper]
}

resource "null_resource" "wait_for_kafkacluster" {
  provisioner "local-exec" {
    command = "bash ./wait_for_kafka_cluster.sh"
  }
  depends_on = [null_resource.kafkacluster]
}
#####################################################################################

# prometheus-kafka-exporter
resource "helm_release" "isg-pkafka" {
  name       = "isg-pkafka"
  chart      = "./monitor/prometheus-kafka-exporter"
  wait       = true
  timeout    = 600
  namespace  = "monitoring"
  depends_on = [null_resource.wait_for_kafkacluster]
}
# Kafka-topics
# resource "null_resource" "kafka-topics" {
#   provisioner "local-exec" {
#     command = "kubectl apply -f ./kafka/kafka-topic-templet.yaml -n kb"
#   }
#   depends_on = [null_resource.wait_for_kafkacluster]
# }
#####################################################################################