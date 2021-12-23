class SnsCredential < ApplicationRecord
  belongs_to :trainer, optional: true
  belongs_to :cliant, optional: true
end
