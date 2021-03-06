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

Feature: Project Visibility
  Background:
    Given there is 1 project with the following:
      | name            | Bob's Accounting     |
      | identifier      | bobs-accounting      |
    Then the project "Bob's Accounting" is public

  Scenario: A Project is visible on the landing page if it is set to public
    Given I am on the login page
    Then I should see "Select a project" within "#top-menu-items"
    When I go to the overall Projects page
    Then I should see "Bob's Accounting" within "#content"

  Scenario: Project is not visible on the landing page if it is not set to public
    Given the project "Bob's Accounting" is not public
    And I am on the login page
    Then I should not see "Select a project" within "#top-menu-items"
