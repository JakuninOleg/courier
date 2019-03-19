# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

statuses = Status.create([{general: "Новая", supervisor: "Распределить"},
                          {general: "Выдача документов", courier: "Получить документы", supervisor: "Выдать документы"},
                          {general: "Подтверждение встречи", courier: "Подтвердить встречу", supervisor: "Подтверждение встречи курьером"},
                          {general: "Встреча в спутнике", authorizer: "Подтвердить встречу в спутнике", courier: "Ожидание оператора", supervisor: "Подтверждение встречи авторизатором"},
                          {general: "Верификация", authorizer: "Встреча подтверждена", courier: "Верифицировать", supervisor: "Верификация"},
                          {general: "Верификация в спутнике", authorizer: "Верифицировать в спутнике", courier: "Ожидание оператора", supervisor: "Верификация"},
                          {general: "Загрузка фото", authorizer: "Клиент верифицирован", courier: "Загрузить фото", supervisor: "Клиент верифицирован"},
                          {general: "Проверка Фото", authorizer: "Проверить фото", courier: "Проверка фото", supervisor: "Фото загружены"},
                          {general: "Ошибка фото", authorizer: "Ожидание новых фото", courier: "Сделать новое фото", supervisor: "Ошибка фото"},
                          {general: "Привязка карты", authorizer: "Ожидание номера карты", courier: "Привязать карту", supervisor: "Клиент авторизован"},
                          {general: "Привязка карты Sptnk", authorizer: "Привязать карту", courier: "Проверка карты", supervisor: "Привязка карты"},
                          {general: "Сдача документов", courier: "Сдать документы в офис", supervisor: "Получить документы"},
                          {general: "Перенос встречи", authorizer: "Перенести встречу", supervisor: "Перенос встречи"},
                          {general: "Заявка закрыта", supervisor: "Документы получены"},
                          {general: "Заявка отменена"}])

roles = Role.create([{name: "Courier"}, {name: "Authorizer"}, {name: "Supervisor"}])

regions = Region.create([{name: "Москва"}])

refusereason = Refusereason.create([{name: "Повреждённый паспорт"}, {name: "Несоответствие данных"}, {name: "Состояние алкогольного/наркотического опьянения"}, {name: "Недееспособность"}])

rejectreason = Rejectreason.create([{name: "Недозвон"}, {name: "Верификация не пройдена"}, {name: "Авторизация не пройдена"}, {name: "Отказ клиента"}])

timeslots = Timeslot.create([{range: "8:00 - 10:00"}, {range: "10:00 - 12:00"}, {range: "12:00 - 14:00"}, {range: "14:00 - 16:00"},
                             {range: "13:00 - 15:00"}, {range: "15:00 - 17:00"}, {range: "17:00 - 19:00"}, {range: "19:00 - 21:00"}])

users = User.create([{email: "courier1@gmail.com", password: "666666", password_confirmation: "666666", role: Role.find(1)},
                     {email: "courier2@gmail.com", password: "666666", password_confirmation: "666666", role: Role.find(1)},
                     {email: "authorizer1@gmail.com", password: "666666", password_confirmation: "666666", role: Role.find(2)},
                     {email: "supervisor1@gmail.com", password: "666666", password_confirmation: "666666", role: Role.find(3)}])

Administrator.create(email: "admin@gmail.com", password: "666666", first_name: "Oleg", last_name: "Jakunin")
