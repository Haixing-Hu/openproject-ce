#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

Feature: User session
  Background:
    Given there is 1 user with the following:
      | login    | bob        |

  Scenario: Autologin works if enabled
    Given the "autologin" setting is set to 1
    Given the "session_ttl_enabled" setting is set to true
    And the "session_ttl" setting is set to 5
    When I login with autologin enabled as "bob"
    And I wait for "10" minutes
    And I go to the home page
    Then I should be logged in as "bob"

  Scenario: Autologin does not work if disabled
    Given the "autologin" setting is set to 0
    Given the "session_ttl_enabled" setting is set to true
    And the "session_ttl" setting is set to 5
    When I login with autologin enabled as "bob"
    And I wait for "10" minutes
    And I go to the home page
    Then I should be logged out
