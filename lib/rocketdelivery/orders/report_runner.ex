defmodule Rocketdelivery.Orders.ReportRunner do
  use GenServer

  require Logger

  alias Rocketdelivery.Orders.Report

  # Client

  def start_link(_initial_stack) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server (Callbacks)

  @impl true
  def init(stack) do
    schedule_report_generation()

    {:ok, stack}
  end

  @impl true
  # RECEBE QUALQUER TIPO DE MENSAGEM
  def handle_info(:generate, state) do
    Logger.info("Generating report...")

    Report.create()
    schedule_report_generation()

    {:noreply, state}
  end

  def schedule_report_generation do
    # 1000 * 60 = 1 minutes
    Process.send_after(self(), :generate, 1000 * 60)
  end
end
