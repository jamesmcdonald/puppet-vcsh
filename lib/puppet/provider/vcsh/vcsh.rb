Puppet::Type.type(:vcsh).provide(:vcsh) do
  desc "Implement vcsh repo goo"

  def create
    puts "#{@resource[:name]} #{self.repo}"
    puts `su #{@resource[:user]} -c "vcsh clone #{@resource.should(:repo)} #{@resource[:name]}"`
  end

  def destroy
    false 
  end

  def exists?
    `su #{@resource[:user]} -c "vcsh list"`.split.include? @resource[:name]
  end

  def repo
    # This is messy to get something working quickly
    if self.exists?
      `su #{@resource[:user]} -c "vcsh #{@resource[:name]} remote -v"`.lines[0].split[1]
    else
      :absent
    end
  end
end
