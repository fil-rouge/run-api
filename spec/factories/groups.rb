FactoryGirl.define do

  factory :group do
    name "le groupe des 5"
    description "c'est le groupe pour les 5 detectives de folies"
    # TODO : add admin id
  end

  factory :courrirALyon, class: Group do
    name "Courrir a lyon"
    description "c'est le groupe pour les gens qui courrent a lyon"
    # TODO : add admin id
  end
end