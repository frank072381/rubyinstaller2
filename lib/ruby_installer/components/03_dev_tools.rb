module RubyInstaller
module Components
class DevTools < Base
  def self.depends
    %w[msys2]
  end

  def description
    "MSYS2 and MINGW development toolchain"
  end

  def execute(args)
    msys = RubyInstaller.msys2_installation
    msys.with_msys_apps_enabled do
      puts "Install #{description} ..."
      res = system("pacman", "-S", "--needed", "--noconfirm", "base-devel", "#{msys.mingw_package_prefix}-toolchain")
      puts "Install #{description} #{res ? green("succeeded") : red("failed")}"
      raise "pacman failed" unless res
    end
  end
end
end
end
