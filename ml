# image: gzynda/tacc-base
# Version: 0.0.2

# Use 16.04 LTS
FROM gzynda/tacc-maverick-ml:latest

########################################
# Configure ENV
########################################

ENV DEBIAN_FRONTEND=noninteractive

########################################
# Add docker-clean
########################################

RUN echo "#!/bin/bash\n\
apt-get clean\n\
[ -x \"\$(command -v conda)\" ] && conda clean -tipsy\n\
for dir in /tmp/* /var/tmp/* /home/jupyter/{.ccache,.cache/pip,conda-bld,.conda} /root/* /root/\.[^\.]* /var/lib/apt/lists/* /var/log/*; do\n\
	[ -e \$dir ] && rm -rf \$dir || true\n\
done" > /usr/bin/docker-clean && chmod a+rx /usr/bin/docker-clean && docker-clean

RUN conda install h5py

########################################
# Add mount points
########################################

#RUN mkdir /scratch /work /home1 /gpfs /corral-repl /corral-tacc /data
