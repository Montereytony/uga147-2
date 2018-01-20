# to do a test build by hand (instead of the automated hub.docker.com build) you
# can do this:
#
#    docker build --rm --tag ugba147-2
#
#
# Development done on my mac laptop, used these commands to push files
# to the github:
#
#  git status
#  git add Dockerfile
#  git status
#  git commit -m "added nbextensions for class and moved to a new repository"
#  git push
#
#
#

FROM jupyter/datascience-notebook

USER root

RUN ln -s /bin/tar /bin/gtar
RUN /usr/bin/apt-get install unzip
RUN /usr/bin/wget https://github.com/jgm/pandoc/releases/download/2.1/pandoc-2.1-1-amd64.deb
RUN /usr/bin/dpkg -i pandoc-2.1-1-amd64.deb
RUN rm pandoc-2.1-1-amd64.deb

USER jovyan

#RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/htmlwidgets_0.9.tar.gz',repos=NULL)"
#RUN conda install r-htmlwidgets


RUN conda install \
    r-htmlwidgets \
 	r-GGally \
 	r-mclust \
 	r-gridExtra \
 	r-e1071 \
 	r-rgl \
 	r-xlsxjars \
 	r-xlsx \
 	r-rJava \
 	r-pracma \
 	ipython \
 	numpy \
 	pandas \
 	plotnine \
 	matplotlib \
 	seaborn \
    r-aer  \
    r-png \
    phantomjs 


RUN Rscript -e "install.packages('https://ftp.osuosl.org/pub/cran/src/contrib/wordcloud2_0.2.1.tar.gz',repos=NULL)"
RUN conda install -c https://conda.anaconda.org/amueller wordcloud
RUN conda install -c statsmodels statsmodels
RUN conda install -c bioconda r-ggdendro 


RUN pip install scikit-neuralnetwork

RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/webshot_0.5.0.tar.gz',repos=NULL)"

RUN pip install jupyter_contrib_nbextensions
