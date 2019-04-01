class Physician < ApplicationRecord
    has_many(
        :appointments,
        class_name: 'Appointment',
        foreign_key: :physician_id,
        primary_key: :id
    )

    has_many :patients, through: :appointments, source: :patient
end

class Appointment < ApplicationRecord
    belongs_to(
        :physician,
        class_name: 'Physician',
        foreign_key: :physician_id,
        primary_key: :id
    )

    belongs_to(
        :patient,
        class_name: 'Patient',
        foreign_key: :patient_id,
        primary_key: :id
    )
end

class Patient < ApplicationRecord
    has_many(
        :appointments,
        class_name: 'Appointment'
    )