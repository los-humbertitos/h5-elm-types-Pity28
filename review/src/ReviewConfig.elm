module ReviewConfig exposing (config)

{-| Do not rename the ReviewConfig module or the config function, because
`elm-review` will look for these.

To add packages that contain rules, add them to this review project using

    `elm install author/packagename`

when inside the directory containing this file.

-}

import NoMissingTypeAnnotation
import NoMissingTypeAnnotationInLetIn
import Review.Rule exposing (Rule)


config : List Rule
config =
    [ NoMissingTypeAnnotation.rule
    , NoMissingTypeAnnotationInLetIn.rule
    ]


type GradeStatus
    = Approved
    | Failed
    | Pending


categoricalGrade : List Float -> List GradeStatus
categoricalGrade grades =
    List.map toStatus grades


toStatus : Float -> GradeStatus
toStatus n =
    if n < 0 then
        Pending

    else if n > 7 then
        Approved

    else
        Failed


type AirplaneStatus
    = OnTime
    | Boarding
    | Delayed
    | Cancelled


airplaneScheduleAction : AirplaneStatus -> String
airplaneScheduleAction status =
    case status of
        OnTime ->
            "Proceed to departure lounge."

        Boarding ->
            "Go to gate immediately."

        Delayed ->
            "Check screens for new time."

        Cancelled ->
            "See agent for rebooking."


airportAction : List AirplaneStatus -> List String
airportAction statuses =
    List.map airplaneScheduleAction statuses
