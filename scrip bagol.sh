!apt install xrdp
!service xrdp start
!apt install firefox
!apt install pciutils
! wget https://raw.githubusercontent.com/admin123356/bagol1/main/CRD_COLAB_EXE.sh &> /dev/null
! chmod +x CRD_COLAB_EXE.sh
! ./CRD_COLAB_EXE.sh

!pip install git+https://github.com/SwayamJoshi87/remocolab.xrdp.git
import remocolab
remocolab.setupVNC()

! sleep 43200
