# frozen_string_literal: true

#  Copyright (c) 2023, GSoA. This file is part of
#  hitobito_die_mitte and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

class GenderCustom

  I18N_KEY_PREFIX = 'activerecord.models.gender_custom'

  class << self
    def available
      available = {}
      I18n.t("#{I18N_KEY_PREFIX}.available").each do |s|
        available[s.first.to_s] = s.last
      end
      {"" => available.delete("_nil")}.merge!(available)
    end
  end

  def initialize(person)
    @person = person
  end

  def available
    r=self.class.available
    if (Person::GENDERS & r.keys).include? @person.gender.presence
      r = {@person.gender => r.delete(@person.gender)}.merge!(r)
    end
    r
  end
end
