locals {
  nat_gateway_name = "ng-${var.project_name}-${var.environment}-${var.location}"

  common_tags = {
    project = var.project_name
    owner   = var.owner
  }
}