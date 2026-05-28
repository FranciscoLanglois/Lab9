# db/seeds.rb

Owner.destroy_all
Pet.destroy_all
Vet.destroy_all
Appointment.destroy_all
Treatment.destroy_all
User.destroy_all

admin_user = User.create!(
  email: "admin@vetclinic.com",
  password: "admin123",
  password_confirmation: "admin123",
  first_name: "Admin",
  last_name: "Sistema",
  role: :admin
)
vet_user1 = User.create!(
  email: "ana.vet@vetclinic.com",
  password: "vet123",
  password_confirmation: "vet123",
  first_name: "Ana",
  last_name: "Martínez",
  role: :vet
)
vet_user2 = User.create!(
  email: "carlos.vet@vetclinic.com",
  password: "vet456",
  password_confirmation: "vet456",
  first_name: "Carlos",
  last_name: "Rodríguez",
  role: :vet
)
owner_user1 = User.create!(
  email: "juan.owner@vetclinic.com",
  password: "owner123",
  password_confirmation: "owner123",
  first_name: "Juan",
  last_name: "Pérez",
  role: :owner
)
owner_user2 = User.create!(
  email: "maria.owner@vetclinic.com",
  password: "owner456",
  password_confirmation: "owner456",
  first_name: "María",
  last_name: "Gómez",
  role: :owner
)
owner1 = Owner.create!(
  user_id: owner_user1.id,
  first_name: "Juan",
  last_name: "Pérez",
  email: "juan.perez@email.com",
  phone: "+56912345678",
  address: "Calle Principal 123, Santiago"
)
owner2 = Owner.create!(
  user_id: owner_user2.id,
  first_name: "María",
  last_name: "Gómez",
  email: "maria.gomez@email.com",
  phone: "+56987654321",
  address: "Avenida Los Pajaritos 456, Santiago"
)
pet1 = owner1.pets.create!(
  name: "Firulais",
  species: "dog",
  breed: "Labrador",
  date_of_birth: "2020-01-01",
  weight: 25
)
pet2 = owner1.pets.create!(
  name: "Michi",
  species: "cat",
  breed: "Siames",
  date_of_birth: "2021-03-15",
  weight: 5
)
pet3 = owner2.pets.create!(
  name: "Luna",
  species: "cat",
  breed: "Persa",
  date_of_birth: "2020-06-20",
  weight: 4
)
pet4 = owner2.pets.create!(
  name: "Rocky",
  species: "dog",
  breed: "Bulldog",
  date_of_birth: "2019-11-10",
  weight: 20
)
vet1 = Vet.create!(
  user_id: vet_user1.id,
  first_name: "Ana",
  last_name: "Martínez",
  email: "ana.martinez@vetclinic.com",
  phone: "+56922223333",
  specialization: "Medicina General"
)
vet2 = Vet.create!(
  user_id: vet_user2.id,
  first_name: "Carlos",
  last_name: "Rodríguez",
  email: "carlos.rodriguez@vetclinic.com",
  phone: "+56944445555",
  specialization: "Cirugía"
)
appointment1 = Appointment.create!(
  pet: pet1,
  vet: vet1,
  date: Time.now + 1.day,
  reason: "Chequeo anual",
  status: "scheduled"
)
appointment2 = Appointment.create!(
  pet: pet2,
  vet: vet1,
  date: Time.now + 2.days,
  reason: "Vacunación",
  status: "scheduled"
)
appointment5 = Appointment.create!(
  pet: pet2,
  vet: vet2,
  date: Time.now + 3.days,
  reason: "Segunda opinión",
  status: "scheduled"
)
appointment3 = Appointment.create!(
  pet: pet3,
  vet: vet1,
  date: Time.now - 2.days,
  reason: "Revisión",
  status: "completed"
)
appointment4 = Appointment.create!(
  pet: pet4,
  vet: vet2,
  date: Time.now - 5.days,
  reason: "Cirugía",
  status: "completed"
)
appointment6 = Appointment.create!(
  pet: pet3,
  vet: vet2,
  date: Time.now + 4.days,
  reason: "Seguimiento",
  status: "scheduled"
)
treatment1 = Treatment.create!(
  appointment: appointment3,
  name: "Vacuna Antirrábica",
  medication: "Rabies Vaccine",
  dosage: "1 ml",
  administered_at: Time.now - 1.day,
  notes: "<h3>Vaccination Procedure</h3>
          <p>Administered <strong>rabies vaccine</strong> following standard protocol.</p>
          <h4>Steps performed:</h4>
          <ul>
            <li>Physical examination before vaccination</li>
            <li>Temperature check: <strong>38.5°C (101.3°F)</strong> - normal</li>
            <li>Subcutaneous injection in cervical region</li>
            <li>15-minute observation period post-vaccination</li>
          </ul>
          <p><strong>Status:</strong> <em>OK</em> - No adverse reactions observed.</p>
          <p><em>Next dose scheduled in 1 year.</em></p>"
)
treatment2 = Treatment.create!(
  appointment: appointment4,
  name: "Procedimiento Quirúrgico",
  medication: "Anestesia General",
  dosage: "Según peso",
  administered_at: Time.now - 4.days,
  notes: "<h3>Surgical Procedure Report</h3>
          <p><strong>Procedure:</strong> Routine ovariohysterectomy (spay)</p>
          <h4>Pre-operative:</h4>
          <ul>
            <li><strong>12-hour fast</strong> completed before procedure</li>
            <li>Pre-anesthetic blood work: <em>within normal limits</em></li>
            <li>Pre-medication: Acepromazine <strong>0.05 mg/kg</strong></li>
          </ul>
          <h4>Intra-operative:</h4>
          <ul>
            <li>Anesthesia induced with Propofol (<strong>4 mg/kg</strong>)</li>
            <li>Maintained with Isoflurane at <strong>1.5%</strong></li>
            <li>Vital signs monitored throughout procedure</li>
            <li>Surgery duration: <strong>45 minutes</strong></li>
            <li>No complications during procedure</li>
          </ul>
          <h4>Post-operative:</h4>
          <ul>
            <li>Analgesic: <strong>Meloxicam</strong> for pain management</li>
            <li>Prophylactic antibiotics administered</li>
            <li>Recovery period: <strong>uneventful</strong></li>
          </ul>
          <p><strong>Status:</strong> <em>Done</em> - Patient recovering well in post-op area.</p>
          <p><em>Follow-up appointment scheduled for suture removal in 10-14 days.</em></p>"
)