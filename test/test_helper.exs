ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Rocketdelivery.Repo, :manual)

Mox.defmock(Rocketdelivery.ViaCep.ClientMock, for: Rocketdelivery.ViaCep.Behaviour)
