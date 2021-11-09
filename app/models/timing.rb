class Timing < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '朝食' },
    { id: 3, name: '昼食' },
    { id: 4, name: '夕食' },
    { id: 5, name: '間食' },
    { id: 6, name: '夜食' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts

  end