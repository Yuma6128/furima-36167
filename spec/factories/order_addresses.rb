FactoryBot.define do
  factory :order_address do
    postal_code {'134-0088'}
    item_prefecture_id { '14' }
    city {'江戸川区西葛西'}
    address {'青山1-1-1'}
    phone_number {'09012345678'}
    building {'建物名202'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
