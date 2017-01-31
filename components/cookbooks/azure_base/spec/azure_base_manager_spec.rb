require 'simplecov'
SimpleCov.start
require File.expand_path('../../libraries/azure_base_manager.rb', __FILE__)
require 'fog/azurerm'
require 'chef'

describe AzureBase::AzureBaseManager do
  before do
    workorder = File.read('../azure_base/spec/node.json')
    workorder_hash = JSON.parse(workorder)

    @node = Chef::Node.new
    @node.normal = workorder_hash
  end

  describe '#initialize' do
    it 'creates token with compute service' do
      @node.normal['app_name'] = 'compute'
      azure_base_manager = AzureBase::AzureBaseManager.new(@node)

      expect(azure_base_manager.cloud_name).to eq('Azure')
      expect(azure_base_manager.tenant).to eq('########-####-####-####-############')
      expect(azure_base_manager.client).to eq('########-####-####-####-############')
      expect(azure_base_manager.client_secret).to eq('############################################')
      expect(azure_base_manager.creds).to_not eq(nil)
    end

    it 'creates token with fqdn service' do
      @node.normal['app_name'] = 'fqdn'
      azure_base_manager = AzureBase::AzureBaseManager.new(@node)

      expect(azure_base_manager.cloud_name).to eq('Azure')
      expect(azure_base_manager.tenant).to eq('########-####-####-####-############')
      expect(azure_base_manager.client).to eq('########-####-####-####-############')
      expect(azure_base_manager.client_secret).to eq('############################################')
      expect(azure_base_manager.creds).to_not eq(nil)
    end

    it 'creates token with lb service' do
      @node.normal['app_name'] = 'lb'
      azure_base_manager = AzureBase::AzureBaseManager.new(@node)

      expect(azure_base_manager.cloud_name).to eq('Azure')
      expect(azure_base_manager.tenant).to eq('########-####-####-####-############')
      expect(azure_base_manager.client).to eq('########-####-####-####-############')
      expect(azure_base_manager.client_secret).to eq('############################################')
      expect(azure_base_manager.creds).to_not eq(nil)
    end

    it 'creates token with storage service' do
      @node.normal['app_name'] = 'storage'
      azure_base_manager = AzureBase::AzureBaseManager.new(@node)

      expect(azure_base_manager.cloud_name).to eq('Azure')
      expect(azure_base_manager.tenant).to eq('########-####-####-####-############')
      expect(azure_base_manager.client).to eq('########-####-####-####-############')
      expect(azure_base_manager.client_secret).to eq('############################################')
      expect(azure_base_manager.creds).to_not eq(nil)
    end


  end
end
