# install.packages("rvest")
# install.packages("magrittr")
library(rvest)
library(magrittr)

url="https://www.mobile01.com/forumtopic.php?c=29"

htmlContent = read_html(url)
class(htmlContent)

# Test 1

titlePath = "/html/body/div[1]/div[3]/div[2]/div[3]/div[6]/table/tbody/tr/td[1]/span/a"
titles= htmlContent %>% html_node(xpath=titlePath) %>% html_text()

replyPath = "/html/body/div[1]/div[3]/div[2]/div[3]/div[6]/table/tbody/tr/td[2]"
replies= htmlContent %>% html_node(xpath=replyPath) %>% html_text()

T1 = data.frame(Title = titles, Reply =replies )
T1


# Test 2
titlePath2 = "/html/body/div[1]/div[3]/div[2]/div[3]/div[6]/table/tbody/tr[2]/td[1]/span/a"
titles2= htmlContent %>% html_node(xpath=titlePath2) %>% html_text()

replyPath2 = "/html/body/div[1]/div[3]/div[2]/div[3]/div[6]/table/tbody/tr[2]/td[2]"
replies2= htmlContent %>% html_node(xpath=replyPath2) %>% html_text()

T2 = data.frame(Title = titles2, Reply =replies2 )
T2


ALLDT = data.frame( )
TEM = data.frame( )
for( i in c(1:30)){
  
titlePathh = "/html/body/div[1]/div[3]/div[2]/div[3]/div[6]/table/tbody/tr["
titlePatht = "]/td[1]/span/a"
titlePatha = paste0( titlePathh, as.character(i), titlePatht)
titles.tem= htmlContent %>% html_node(xpath=titlePatha) %>% html_text()

replyPathh = "/html/body/div[1]/div[3]/div[2]/div[3]/div[6]/table/tbody/tr["
replyPatht = "]/td[2]"
replyPatha = paste0( replyPathh, as.character(i), replyPatht)
replies.tem= htmlContent %>% html_node(xpath=replyPatha) %>% html_text()
    TEM = data.frame( Title = titles.tem, Reply =replies.tem)

ALLDT = rbind(ALLDT,TEM)
}


# Test 3
url2="https://www.chinatimes.com/newspapers/2601/?chdtv"

htmlContent2 = read_html(url2)
titlePath3 = "/html/body/div[2]/div[1]/div[2]/div[1]/section[1]/ul[1]/li[1]/div[1]/div[1]/div[1]/h3[1]/a"

titles3= htmlContent2 %>% html_node(xpath=titlePath3) %>% html_text()
T3 = data.frame(Title = titles3 )
T3

CNALLDT = data.frame( )
CNTEM = data.frame( )
for( g in c(1:20)){
  
cn.titlePathh = "/html/body/div[2]/div[1]/div[2]/div[1]/section[1]/ul[1]/li["
cn.titlePatht = "]/div[1]/div[1]/div[1]/h3[1]/a"
cn.titlePatha = paste0( cn.titlePathh, as.character(g), cn.titlePatht)
cn.titles.tem= htmlContent2 %>% html_node(xpath=cn.titlePatha) %>% html_text()

CNTEM = data.frame( Title = cn.titles.tem)
if (is.na(CNTEM)== TRUE){

cn.titlePathh = "/html/body/div[2]/div[1]/div[2]/div[1]/section[1]/ul[1]/li["
cn.titlePatht = "]/div[1]/div[1]/div[2]/h3[1]/a"
cn.titlePatha = paste0( cn.titlePathh, as.character(g), cn.titlePatht)
cn.titles.tem= htmlContent2 %>% html_node(xpath=cn.titlePatha) %>% html_text()
CNTEM = data.frame( Title = cn.titles.tem)
CNALLDT = rbind(CNALLDT,CNTEM)
} else{

CNALLDT = rbind(CNALLDT,CNTEM)
}

}


# Test 4
# url.tem="https://www.chinatimes.com/newspapers/2601/?chdtv"

# https://www.chinatimes.com/newspapers/2601?page=1&chdtv

 for (p in c(1:10)){
     
     url.tem.h = "https://www.chinatimes.com/newspapers/2601?page="
     url.tem.t = "&chdtv"
     url.tem.a = paste0( url.tem.h, as.character(p), url.tem.t)
 print(url.tem.a)}

###

CNALLDT = data.frame( )
CNTEM = data.frame( )
CNALLPage = data.frame( )

for (p in c(1:10)){

url.tem.h = "https://www.chinatimes.com/newspapers/2601?page="
url.tem.t = "&chdtv"
url.tem.a = paste0( url.tem.h, as.character(p), url.tem.t)

htmlContent.t = read_html(url.tem.a)

for( g in c(1:20)){
  
cn.titlePathh = "/html/body/div[2]/div[1]/div[2]/div[1]/section[1]/ul[1]/li["
cn.titlePatht = "]/div[1]/div[1]/div[1]/h3[1]/a"
cn.titlePatha = paste0( cn.titlePathh, as.character(g), cn.titlePatht)
cn.titles.tem= htmlContent.t %>% html_node(xpath=cn.titlePatha) %>% html_text()

CNTEM = data.frame( Title = cn.titles.tem)
if (is.na(CNTEM)== TRUE){

cn.titlePathh = "/html/body/div[2]/div[1]/div[2]/div[1]/section[1]/ul[1]/li["
cn.titlePatht = "]/div[1]/div[1]/div[2]/h3[1]/a"
cn.titlePatha = paste0( cn.titlePathh, as.character(g), cn.titlePatht)
cn.titles.tem= htmlContent.t %>% html_node(xpath=cn.titlePatha) %>% html_text()
CNTEM = data.frame( Title = cn.titles.tem)
CNALLDT = rbind(CNALLDT,CNTEM)
} else{

CNALLDT = rbind(CNALLDT,CNTEM)
}

}

CNALLPage = rbind(CNALLPage,CNALLDT)

}


###

html<-read_html("https://www.chinatimes.com/newspapers/2601/?chdtv")
 
node<-html_nodes(html," .title ") ; node

text<-html_text(node) ; text
TemDTT1<- data.frame(text)



###

CNALLPage2 = data.frame( )

for (p in c(1:10)){

url.tem.h = "https://www.chinatimes.com/newspapers/2601?page="
url.tem.t = "&chdtv"
url.tem.a = paste0( url.tem.h, as.character(p), url.tem.t)

htmlContent.t = read_html(url.tem.a)

node<-html_nodes(htmlContent.t ," .title ")
text<-html_text(node)
TemDTT2<- data.frame(text)
CNALLPage2 = rbind(CNALLPage2,TemDTT2)

}