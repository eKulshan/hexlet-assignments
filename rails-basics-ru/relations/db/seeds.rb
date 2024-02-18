# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

User.create([{ name: 'user 1' }, { name: 'user 2' }])
Status.create([
                { name: 'New' },
                { name: 'In Progress' },
                { name: 'Done' }
              ])
