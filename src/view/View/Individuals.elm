module View.Individuals exposing (view)

import Bootstrap.Card as Card
import Bootstrap.Card.Block as Block
import Bootstrap.Form as Form
import Bootstrap.Form.Input as Input
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Html exposing (Html, div, span, text)
import Model.Individual exposing (Individuals, Sex(..))
import Model.Types exposing (BirthDate)
import Update exposing (Msg(..))


view : Individuals -> (BirthDate -> String) -> (BirthDate -> String) -> Html Msg
view individuals displayBirthDate displayAge =
    let
        currentIndividual =
            Model.Individual.current individuals
    in
    Card.config []
        |> Card.block []
            [ Block.custom <|
                Grid.container []
                    [ Form.form []
                        [ Form.row []
                            [ Form.colLabel [ Col.xs4 ] [ text "Name" ]
                            , Form.col []
                                [ Input.text [ Input.plainText True, Input.value <| currentIndividual.name ] ]
                            ]
                        , Form.row []
                            [ Form.colLabel [ Col.xs4 ] [ text "Sex" ]
                            , Form.col []
                                [ Input.text [ Input.plainText True, Input.value <| displaySex currentIndividual.sex ] ]
                            ]
                        , Form.row []
                            [ Form.colLabel [ Col.xs4 ] [ text "BirthDate" ]
                            , Form.col []
                                [ Input.text [ Input.plainText True, Input.value <| displayBirthDate currentIndividual.birthdate ] ]
                            ]
                        , Form.row []
                            [ Form.colLabel [ Col.xs4 ] [ text "Age" ]
                            , Form.col []
                                [ Input.text [ Input.plainText True, Input.value <| displayAge currentIndividual.birthdate ] ]
                            ]
                        ]
                    ]
            ]
        |> Card.view


displaySex : Model.Individual.Sex -> String
displaySex sex =
    case sex of
        Male ->
            "Male"

        Female ->
            "Female"
