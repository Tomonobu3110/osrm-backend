@routing @bicycle @safety
Feature: Bicycle - Adds penalties to unsafe roads

    Background:
        Given the profile file
        """
        require 'bicycle'
        properties.weight_name = 'cyclability'
        """

    Scenario: Bike - Apply penalties to ways without cycleways
        Then routability should be
            | highway       | cycleway | forw       | backw      | forw_rate | backw_rate |
            | motorway      |          |            |            |           |            |
            | primary       |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | secondary     |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | tertiary      |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | primary_link  |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | secondary_link|          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | tertiary_link |          | 15 km/h    | 15 km/h    | 2.9       | 2.9        |
            | residential   |          | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | cycleway      |          | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | footway       |          | 6 km/h +-1 | 6 km/h +-1 | 1.7       | 1.7        |

    Scenario: Bike - Apply no penalties to ways with cycleways
        Then routability should be
            | highway       | cycleway | forw    | backw   | forw_rate | backw_rate |
            | motorway      | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | primary       | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | secondary     | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | tertiary      | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | primary_link  | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | secondary_link| lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | tertiary_link | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | residential   | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | cycleway      | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |
            | footway       | lane     | 15 km/h | 15 km/h | 4.2       | 4.2        |

    Scenario: Bike - Apply no penalties to ways in direction of cycleways
        Then routability should be
            | highway       | cycleway:right | cycleway:left | forw       | backw      | forw_rate | backw_rate |
            | motorway      | lane           |               | 15 km/h    |            | 4.2       |            |
            | primary       | lane           |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | secondary     | lane           |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | tertiary      | lane           |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | primary_link  | lane           |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | secondary_link| lane           |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | tertiary_link | lane           |               | 15 km/h    | 15 km/h    | 4.2       | 2.9        |
            | residential   | lane           |               | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | cycleway      | lane           |               | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | footway       | lane           |               | 15 km/h    | 6 km/h +-1 | 4.2       | 1.7        |
            | motorway      |                | lane          |            | 15 km/h    |           | 4.2        |
            | primary       |                | lane          | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | secondary     |                | lane          | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | tertiary      |                | lane          | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | primary_link  |                | lane          | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | secondary_link|                | lane          | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | tertiary_link |                | lane          | 15 km/h    | 15 km/h    | 2.9       | 4.2        |
            | residential   |                | lane          | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | cycleway      |                | lane          | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | footway       |                | lane          | 6 km/h +-1 | 15 km/h    | 1.7       | 4.2        |


    Scenario: Bike - Don't apply penalties for all kind of cycleways
        Then routability should be
            | highway       | cycleway    | forw       | backw      | forw_rate | backw_rate |
            | tertiary      | shared_lane | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | tertiary      | lane        | 15 km/h    | 15 km/h    | 4.2       | 4.2        |
            | tertiary      | opposite    | 15 km/h    | 15 km/h    | 2.9       | 4.2        |