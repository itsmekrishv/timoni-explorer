bundle: {
    apiVersion: "v1alpha1"
    name:       "podinfo"
    instances: {
        redis: {
            module: {
                url:     "oci://ghcr.io/stefanprodan/modules/redis"
                version: "7.0.9"
            }
            namespace: "podinfo"
            values: maxmemory: 256
        }
        podinfo: {
            module: url:     "oci://ghcr.io/stefanprodan/modules/podinfo"
            module: version: "6.3.4"
            namespace: "podinfo"
            values: caching: {
                enabled:  true
                redisURL: "tcp://redis:6379"
            }
        }
    }
}