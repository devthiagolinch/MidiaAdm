namespace :dev do
  DEFAULT_PASSWORD = "123456"
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
    end
      show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando outros administradores...") { %x(rails dev:add_others_admins) }
      show_spinner("Cadastrando o usuário padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando ooutros usuários...") { %x(rails dev:add_others_users) }
      show_spinner("Cadastrando Escala padrão...") { %x(rails dev:add_schedule) }
      show_spinner("Cria entrada financeira...") { %x(rails dev:add_cash_entrance) }

  desc "Adiciona outros adms"
  task add_default_admin: :environment do
    Admin.create!(
      email: "admin@admin.com",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona usuario padrao"
  task add_default_user: :environment do
    User.create!(
      email: "user@user.com",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona o administrador padrão"
  task add_others_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona o outros usuarios"
  task add_others_users: :environment do
    10.times do |i|
      User.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona outros adm"
  task add_schedule: :environment do
    4.times do |i|
      Schedule.create!(
        day: Faker::Date.between(from: '2021-03-01', to: '2021-03-25'),
        morning_tranmission: Faker::Name.name,
        morning_files: Faker::Name.name,
        night_transmission: Faker::Name.name,
        night_files: Faker::Name.name,
        night_sound: Faker::Name.name,
      )
    end
  end

  desc "Cria entrada fincaneira"
  task add_cash_entrance: :environment do
    4.times do |i|
      Entrance.create!(
        date_of_entrance: Faker::Date.between(from: '2021-03-01', to: '2021-03-25'),
        description: Faker::Name.name,
        type_of_entrance: Faker::Types.rb_string,
        value: Faker::Number.number(digits: 4),
      )
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end

end
