### Name: RMethodUtils
### Title: Method Utilities
### Aliases: asMethodDefinition standardGeneric-class
###   standardGenericWithTrace-class nonstandardGeneric-class
###   nonstandardGenericFunction-class
###   nonstandardGroupGenericFunction-class OptionalFunction-class
###   PossibleMethod-class derivedDefaultMethod-class
###   substituteFunctionArgs makeGeneric makeStandardGeneric
###   generic.skeleton defaultDumpName doPrimitiveMethod conformMethod
###   getGeneric getGroup getGroupMembers getMethodsMetaData
###   assignMethodsMetaData matchSignature findUnique MethodAddCoerce
###   .saveImage cacheMetaData cacheGenericsMetaData setPrimitiveMethods
###   missingArg balanceMethodsList sigToEnv rematchDefinition
###   unRematchDefinition addNextMethod,MethodDefinition-method
###   addNextMethod,MethodWithNext-method addNextMethod .valueClassTest
###   .ShortPrimitiveSkeletons .EmptyPrimitiveSkeletons
### Keywords: internal

### ** Examples

getGroup("exp")
getGroup("==", recursive = TRUE)

getGroupMembers("Arith")
getGroupMembers("Math")
getGroupMembers("Ops") # -> its sub groups



