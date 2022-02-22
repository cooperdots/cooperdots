FROM greyltc/archlinux-aur:paru
LABEL maintainer="Cooper b. Anderson"

# Update OS repos and install fish
RUN paru -Syu --noconfirm
RUN paru -S fish --noconfirm

# Create user and add to sudoers
RUN useradd -m cooper
RUN echo "cooper   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers
RUN chown -R cooper:cooper /home/cooper

# Switch to user
USER cooper
WORKDIR /home/cooper

CMD ["/usr/bin/fish"]
