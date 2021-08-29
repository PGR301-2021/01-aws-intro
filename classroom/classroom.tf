module "students" {
  source = "../seat"
  for_each = var.student
  email = each.value.email
  student_id = each.key
}

