resource "kubernetes_namespace_v1" "this" {
    count = length(var.namespaces) > 0 ? length(var.namespaces) : 0
    metadata {
        annotations = {
            name = var.namespaces[count.index]
        }
        labels = {
             mylabel = var.namespaces[count.index]
        }
        name = var.namespaces[count.index]
    }
}

