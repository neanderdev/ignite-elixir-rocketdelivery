defmodule Rocketdelivery.Repo.Migrations.CreatePaymentMethod do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE payment_method AS ENUM ('money', 'debit_card', 'credit_card', 'pix')"
    down_query = "DROP TYPE payment_method"

    execute(up_query, down_query)
  end
end
