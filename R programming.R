a<-10
b<-5
c<-a+b
c

v1<-2.5
v2<-4
r<-v1/v2
r

a<-sqrt(v2)
a

g<-"hello"
n<-"bob"
m<-paste(g,n)
m

#Logical Operators
==
!=
<
>
<=
>=
!
|
&
isTRUE()


result <- 4<5
result
typeof(result)

result2<- !(5>1)
result2

result | result2
result & result2

isTRUE(result)

while(TRUE){
  print("Hello")
}
while(FALSE){
  print("Hello")
}

for(i in 1:5){
  print("Hello World")
}

for(i in 5:10){
  print("Hello R")
}