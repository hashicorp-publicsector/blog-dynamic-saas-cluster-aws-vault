#### Dynamo DB Configuration ####
resource "aws_dynamodb_table" "product_table" {
  attribute {
    name = "ProductID"
    type = "S"
  }

  attribute {
    name = "ShardID"
    type = "S"
  }

  billing_mode = "PROVISIONED"
  hash_key     = "ShardID"
  name         = "ProductsTable_${random_pet.random_pet.id}"

  point_in_time_recovery {
    enabled = "false"
  }

  range_key      = "ProductID"
  read_capacity  = "5"
  stream_enabled = "false"
  table_class    = "STANDARD"
  write_capacity = "5"
}

resource "aws_dynamodb_table_item" "insert_items" {
  for_each   = var.ddb_items
  table_name = aws_dynamodb_table.product_table.name
  hash_key   = aws_dynamodb_table.product_table.hash_key
  range_key  = aws_dynamodb_table.product_table.range_key
  item = jsonencode({
    ShardID     = { S = each.value.shard_id }
    ProductID   = { S = each.value.product_id }
    ProductName = { S = each.value.product_name }
  })
}