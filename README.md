# Equipe:

Marcos patrick saraiva da silva - 496459 <Br />
Igor mourão das neves - 494749 <Br />
Myguel Angello maciel de abreu - 495849 <Br />
Reinaldo da silva nascimento - 499899 <Br />


Front: 
https://github.com/igorNeves007/on-stock/tree/main/front


Back:
https://github.com/MarcosPatrickExe/server-on-stock.git




<Br />
<Br />
<Br />
<Br />


Entidade User
  id       String  @id @default(uuid())
  name     String
  email    String  @unique
  login    String
  password String
  address  String?
  role     Role    @default(CUSTOMER)
