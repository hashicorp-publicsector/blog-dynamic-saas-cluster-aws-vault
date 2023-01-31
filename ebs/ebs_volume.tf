resource "aws_ebs_volume" "tfer--vol-0b1fd7d8523cd7b13" {
  availability_zone    = "us-east-2b"
  encrypted            = "false"
  iops                 = "100"
  multi_attach_enabled = "false"
  size                 = "10"

  tags = {
    CSIVolumeName                               = "pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
    KubernetesCluster                           = "dynamic-policy-saas"
    Name                                        = "dynamic-policy-saas-dynamic-pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
    "ebs.csi.aws.com/cluster"                   = "true"
    "kubernetes.io/cluster/dynamic-policy-saas" = "owned"
    "kubernetes.io/created-for/pv/name"         = "pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
    "kubernetes.io/created-for/pvc/name"        = "data-vault-0"
    "kubernetes.io/created-for/pvc/namespace"   = "vault"
  }

  tags_all = {
    CSIVolumeName                               = "pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
    KubernetesCluster                           = "dynamic-policy-saas"
    Name                                        = "dynamic-policy-saas-dynamic-pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
    "ebs.csi.aws.com/cluster"                   = "true"
    "kubernetes.io/cluster/dynamic-policy-saas" = "owned"
    "kubernetes.io/created-for/pv/name"         = "pvc-7cc307db-65a4-40f6-a8a9-70885e8a67f4"
    "kubernetes.io/created-for/pvc/name"        = "data-vault-0"
    "kubernetes.io/created-for/pvc/namespace"   = "vault"
  }

  throughput = "0"
  type       = "gp2"
}
