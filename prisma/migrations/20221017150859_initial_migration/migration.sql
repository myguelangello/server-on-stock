-- CreateEnum
CREATE TYPE "_Role" AS ENUM ('admin', 'customer');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "address" TEXT,
    "phone" TEXT NOT NULL,
    "role" "_Role" NOT NULL DEFAULT 'customer',

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "price" DOUBLE PRECISION NOT NULL,
    "amount" INTEGER NOT NULL,
    "photo" TEXT,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "purchases" (
    "id" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "hours" TIME NOT NULL,
    "customerId" TEXT NOT NULL,

    CONSTRAINT "purchases_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_favorite_products" (
    "userId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "user_favorite_products_pkey" PRIMARY KEY ("userId","productId")
);

-- CreateTable
CREATE TABLE "users_evaluated_products" (
    "evaluation" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "users_evaluated_products_pkey" PRIMARY KEY ("productId","userId")
);

-- CreateTable
CREATE TABLE "products_on_purchases" (
    "amount" INTEGER NOT NULL,
    "productId" TEXT NOT NULL,
    "purchaseId" TEXT NOT NULL,

    CONSTRAINT "products_on_purchases_pkey" PRIMARY KEY ("productId","purchaseId")
);

-- CreateTable
CREATE TABLE "categories_on_products" (
    "categoryId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "categories_on_products_pkey" PRIMARY KEY ("categoryId","productId")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_favorite_products" ADD CONSTRAINT "user_favorite_products_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_favorite_products" ADD CONSTRAINT "user_favorite_products_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users_evaluated_products" ADD CONSTRAINT "users_evaluated_products_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users_evaluated_products" ADD CONSTRAINT "users_evaluated_products_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_on_purchases" ADD CONSTRAINT "products_on_purchases_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_on_purchases" ADD CONSTRAINT "products_on_purchases_purchaseId_fkey" FOREIGN KEY ("purchaseId") REFERENCES "purchases"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categories_on_products" ADD CONSTRAINT "categories_on_products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categories_on_products" ADD CONSTRAINT "categories_on_products_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
