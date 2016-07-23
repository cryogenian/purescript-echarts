## Module ECharts.Style.Item

#### `ItemLabelRec`

``` purescript
type ItemLabelRec = { show :: Maybe Boolean, position :: Maybe LabelPosition, rotate :: Maybe Boolean, distance :: Maybe Boolean, formatter :: Maybe Formatter, textStyle :: Maybe TextStyle }
```

#### `ItemLabel`

``` purescript
newtype ItemLabel
  = ItemLabel ItemLabelRec
```

##### Instances
``` purescript
EncodeJson ItemLabel
DecodeJson ItemLabel
```

#### `itemLabelDefault`

``` purescript
itemLabelDefault :: ItemLabelRec
```

#### `ItemLabelLineRec`

``` purescript
type ItemLabelLineRec = { show :: Maybe Boolean, length :: Maybe Number, lineStyle :: Maybe LineStyle }
```

#### `ItemLabelLine`

``` purescript
newtype ItemLabelLine
  = ItemLabelLine ItemLabelLineRec
```

##### Instances
``` purescript
EncodeJson ItemLabelLine
DecodeJson ItemLabelLine
```

#### `itemLabelLineDefault`

``` purescript
itemLabelLineDefault :: ItemLabelLineRec
```

#### `IStyleRec`

``` purescript
type IStyleRec = { color :: Maybe CalculableColor, borderColor :: Maybe Color, borderWidth :: Maybe Number, barBorderColor :: Maybe Color, barBorderRadius :: Maybe (Corner Number), barBorderWidth :: Maybe Number, label :: Maybe ItemLabel, labelLine :: Maybe ItemLabelLine, lineStyle :: Maybe LineStyle, areaStyle :: Maybe AreaStyle, chordStyle :: Maybe ChordStyle, nodeStyle :: Maybe NodeStyle, linkStyle :: Maybe LinkStyle }
```

#### `IStyle`

``` purescript
newtype IStyle
  = IStyle IStyleRec
```

##### Instances
``` purescript
EncodeJson IStyle
DecodeJson IStyle
```

#### `istyleDefault`

``` purescript
istyleDefault :: IStyleRec
```

#### `ItemStyleRec`

``` purescript
type ItemStyleRec = { normal :: Maybe IStyle, emphasis :: Maybe IStyle }
```

#### `ItemStyle`

``` purescript
newtype ItemStyle
  = ItemStyle ItemStyleRec
```

##### Instances
``` purescript
EncodeJson ItemStyle
DecodeJson ItemStyle
```

#### `itemStyleDefault`

``` purescript
itemStyleDefault :: ItemStyleRec
```


