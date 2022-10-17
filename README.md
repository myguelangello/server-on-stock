Entidade User
  id       String  @id @default(uuid())
  name     String
  email    String  @unique
  login    String
  password String
  address  String?
  role     Role    @default(CUSTOMER)
