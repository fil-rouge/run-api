FactoryGirl.define do
  factory :circuit do
    distance 2000
    note 4
    date Time.now
    description "petit circuit de 2 km OKLM frere"
    #  TODO: add the pointS and the userS
  end


  factory :marathon, class: Circuit do
    distance 42000
    note 5
    date Time.now
    description "marathon des familles"
    #  TODO: add the pointS and the userS
  end
end