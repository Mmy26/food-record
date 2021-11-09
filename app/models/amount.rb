class Amount < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '多め' },
    { id: 3, name: '普通' },
    { id: 4, name: '少なめ' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts

  end