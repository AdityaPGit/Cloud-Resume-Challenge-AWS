resource "aws_dynamodb_table" "count-dynamodb-table" {
  name           = "counter-keeper-for-crc"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "Identifier"

  attribute {
    name = "Identifier"
    type = "S"
  }

  tags = {
    Identifier = "Cloud Resume Challenge"
  }
}

resource "aws_dynamodb_table_item" "counter-item" {
  table_name = aws_dynamodb_table.count-dynamodb-table.arn
  hash_key = aws_dynamodb_table.count-dynamodb-table.hash_key
  
  item = <<ITEM
  {
    "Identifier":{"S":"Views"},
    "Value":{"N":"0"}
  }
  ITEM
}