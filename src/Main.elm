port module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Decode
import Task as Task
import Time exposing (Time, second)
import Process as Process


---- MODEL ----


type alias Model =
    { loaded : Bool
    }


init : ( Model, Cmd Msg )
init =
    ( Model False, delay <| 5 * second )


delay : Time -> Cmd Msg
delay time =
    Process.sleep time
        |> Task.perform Loaded



---- UPDATE ----


type Msg
    = ElementOnLoad String
    | Loaded ()


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Loaded () ->
            { model | loaded = True } ! []

        ElementOnLoad elementId ->
            model ! [ initLibrary elementId ]



---- VIEW ----


view : Model -> Html Msg
view model =
    if model.loaded then
        div
            [ style [ ( "animation", "pulse 0.1s" ) ]
            , id "its-me"
            , on "webkitAnimationEnd" <| Decode.succeed (ElementOnLoad "its-me")
            ]
            [ img [ src "/logo.svg" ] []
            , h1 [] [ text "Your Elm App is working!" ]
            ]
    else
        div [] [ text "Loading..." ]


port initLibrary : String -> Cmd msg



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
