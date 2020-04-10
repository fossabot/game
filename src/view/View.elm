module View exposing (view)

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Html exposing (Html, div)
import Model exposing (Model)
import Update exposing (Msg)
import View.Clock
import View.Individuals
import View.Random


view : Model -> Html Msg
view model =
    Grid.container []
        [ CDN.stylesheet
        , CDN.fontAwesome
        , Grid.row
            [ Row.centerXs ]
            [ Grid.col []
                [ View.Clock.view model.clock
                , View.Random.view model.seed
                , View.Individuals.view model.individuals (View.Clock.displayBirthDate model.clock) (View.Clock.displayAge model.clock)
                ]
            ]
        ]
