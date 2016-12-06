Puppet::Type.newtype(:vcsh) do
  @doc = 'Manage vcsh repo'
  ensurable

  newparam(:name) do
    desc 'The name of the vcsh repo'
  end

  newparam(:user) do
    desc 'The user to clone the repo as'
  end

  newproperty(:repo) do
    desc 'The git URL of the repo to clone'
  end

  newproperty(:branch) do
    desc 'The name of the branch to use'
  end

  validate do
    raise(Puppet::Error, 'user is a required attribute') unless self[:user]
  end
end
