class ShippingDate < ActiveHash::Base
  self.data = [
      {id: 0, name: '選択してください'},
      {id: 1, name: '支払い後、1~2日で発送'}, {id: 2, name: '支払い後、2~3日で発送'}, {id: 3, name: '支払い後、4~7日で発送'}
  ]
end
