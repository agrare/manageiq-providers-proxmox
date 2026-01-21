module ManageIQ::Providers::Proxmox::InfraManager::Vm::Operations::Power
  extend ActiveSupport::Concern

  def raw_start
    with_provider_connection do |connection|
      action = raw_power_state == "paused" ? "resume" : "start"
      connection.request(:post, "/nodes/#{host.ems_ref}/qemu/#{ems_ref}/status/#{action}")
    end
  end

  def raw_stop
    with_provider_connection do |connection|
      connection.request(:post, "/nodes/#{host.ems_ref}/qemu/#{ems_ref}/status/stop")
    end
  end

  def raw_suspend
    with_provider_connection do |connection|
      connection.request(:post, "/nodes/#{host.ems_ref}/qemu/#{ems_ref}/status/suspend")
    end
  end

  def raw_reboot_guest
    with_provider_connection do |connection|
      connection.request(:post, "/nodes/#{host.ems_ref}/qemu/#{ems_ref}/status/reboot")
    end
  end

  def raw_reset
    with_provider_connection do |connection|
      connection.request(:post, "/nodes/#{host.ems_ref}/qemu/#{ems_ref}/status/reset")
    end
  end

  def raw_shutdown_guest
    with_provider_connection do |connection|
      connection.request(:post, "/nodes/#{host.ems_ref}/qemu/#{ems_ref}/status/shutdown")
    end
  end
end
