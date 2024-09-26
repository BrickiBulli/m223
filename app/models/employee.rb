class Employee < ApplicationRecord
    ROLE_STORAGE_MANAGER = 'StorageManager'.freeze
    ROLE_STORAGE_WORKER = 'StorageWorker'.freeze

    has_many :inventory_entries
    has_many :inventory_exits
    validates :first_name, :last_name, :address, :city, :postal_code, :email, presence: true
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :role, inclusion: { in: [ROLE_STORAGE_MANAGER, ROLE_STORAGE_WORKER] }
    validates :password, presence: true, length: { minimum: 12 }, on: :create
    validates :password, length: { minimum: 12 }, allow_blank: true, on: :update
    has_secure_password
    has_paper_trail

    def storage_manager?
        role == ROLE_STORAGE_MANAGER
    end
    
    def storage_worker?
        role == ROLE_STORAGE_WORKER
    end

    private

    def password_present?
      password.present?
    end
  end
