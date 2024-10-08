#!/bin/bash

##
##  Rapid7 Orchestrator self-extracting installer
##

INTERACTIVE=${INTERACTIVE:=1}
TMPDIR=$(mktemp -d /tmp/r7orchestrator.extract.XXXXXX)
ARCHIVE=$(awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0)

# set the default region configuration URLs
export ICON_API_URL="${ICON_API_URL:=https://us3.api.connect.insight.rapid7.com/}"
export ICON_PLUGIN_REGISTRY_URL="${ICON_PLUGIN_REGISTRY_URL:=https://pulluser_3a346ba90d1f4ba9b0fb:e4822dd0-4e88-4ef2-b5bf-4f30dbfdb3df@us3.plugins.connect.insight.rapid7.com}"
export VERSION="${VERSION:=1.63.2-0-9c12c2b}"

hi() {
  printf -- "$(tput setaf 3)$*$(tput sgr0)\n"
}

help() {
  echo "----"
  hi "Command: $0"
  echo "Installation script for the Rapid7 Orchestrator"
  echo ""
  echo "Useful environment variable flags:"
  echo ""

  hi "INTERACTIVE=[0|1], default is 1"
  echo ""
  echo -e "\tSet to 0 to disable interactive mode (automatic install for configuration management or other scripting)"
  echo -e "\texample: INTERACTIVE=0 $0"
  echo ""

  hi "DEFAULT_R7_PASSWORD=<string, default is changeme>"
  echo ""
  echo -e "\tSets the default password for the rapid7 user created on installation."
  echo ""
  exit 0
}

version() {
  echo "Rapid7 Orchestrator version: ${VERSION}"
  exit 0
}

main() {
  CDIR=$(pwd)
  hi "-> Welcome to the Rapid7 Orchestrator Self-Extracting Installer."
  hi "-> Extracting to ${TMPDIR}"
  tail -n+$ARCHIVE $0 | tar xz -C $TMPDIR
  cd $TMPDIR
  INTERACTIVE=${INTERACTIVE} CHECK_DEPS=1 ./install.sh 2>&1 | tee /tmp/r7install.log
  ret=${PIPESTATUS[0]}

  if [[ "$ret" -ne "0" ]]; then
    # tell the user where the install log can be found.
    hi "-> Contact Rapid7 support and include the error message and installation log."
    hi "-> The full install log can be found at /tmp/r7install.log."
  fi

  cd $CDIR
  rm -rf $TMPDIR

  exit 0
}

if [[ "$1" == "help" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  help
fi

if [[ "$1" == "version" ]] || [[ "$1" == "-v" ]] || [[ "$1" == "--version" ]]; then
  version
fi

main
__ARCHIVE_BELOW__
� u�f �=ks۶��j�
�q�'�~(��ǵ��sR'�G;����$d��H� ����o���)ʖsc�=gZG ��>��]`A���ޟ&<���G������z�x��7�;�Nsc�Z������ѣT$N�أ?xx�bf����M��x��E�9�-�[��s[�`����nU�����<b�/8���?����i��a��CC��Y�0.�8��a�c�M��t�]K����V,���-4���4�	�v΀��j%gqs�4���;���܉��S�={?i�'�dVl,���=��-�޾~Ǻ��~�nr��NN^�d�Cc)�ײ�	�B��sf3��X%̍����7��c�6
��+5_�V� 5A�$~�����B�+��i������'������w����w�����_�f�n�����/hZ3_����w}���t<��{� ~r��fG�%jL�}�D4�l�?J4U���qϝ3.�ș�Sn�"����K�3�t��Ǒ��(�`dI�F�Nv�"���<�x��\��ۀ;�3�_�<�A�%BW�C�!��Y�� "Es�8Ӄ��;���]�Xp����P�H$0 �H���4�m�(6��m{�������Ч[��0�`T 3f�x�.5�90:���8Ɛ�=pƾ�aobw�E�ظD��h4B�x�hJ�S�`?�� RS{5�m�8��.��o��Mc?\����|�D�a�����e��3�i��F68��B�,q���i�@>� q�z��eQ-	c��4�vz �� X�V�n��u+��l�$c��hx�eD�g����5��ǆ��$�|�����������k�����h��&j4N�f�lENn��it����������`"p�(?��D�U�X�'n�B�W��^i�Z;=I��]y�#�NA ��8�@��]B9��0)�`R��$`�R&
�V�CzV����s��n��s�a�㟅�� �����I�����ln.����ρ�9��Q�e�@o����?������zk��=�se0f��X�[L4q%��|��-�������0v[�?(�j�g��l/��C<N�;蓺C��tWD�E���89��|�F�������Mѡ�f����a�L��'8Ǔ(��o]��e1���}�gl���4�㊹t<��ۣ3=��Cz���I�2`�`��/���K�6�U�hB�s���X�t�A���]ɋا'�|3f]0��f>��iRA�:8P"�u������щ����C�Ɋ:C$9�N�^Y������Tu����l���W& �,
)�3��1CYn�XiMA*K�߬@�ne4f5�*-��� <�d o
2��m��|�=���>����\���J,�%�0�U�Q�Q-6�(7�~���E#L����0��yƧU���=�Mxi��,�r�����<����h�����s�!.jQ���`T�4IE� aq}�md�����a�ޛxw�o���,���xt�ߗx��W��F{msa�=�S��-|��C�_nF�[�s���B�?�S��=- �������_[����O'���b\"�8��b)�/�������B�?ȣ��+��T���Y���,��������t���F{j���Y��y�?���������31����&��u����x��{�& �QL��Y���.T�n���릱"�5���q����֩���v{m��?ģ���Y�@�6G�I��C��;<��8���a�8Ĵ	��(��ٿ.�2��X"{��!3k���o�X[�d�L�Y�d`��d�2?�x�&�MJ�`N���ZLӒO�j���Qs��Gj�����Ûo}+z~)݈�|Y`���{�c7���\
��Y.×K�y��`�oT��f����{��4�����	��&'�1Δ$aj�gj�$(��*���a���i�&�,��\�l�"��t�����'��}Yo��epaBc:�=N���!�x�!B{0��Ht�3�[�A����r7E:,��,h�{s�J5�I`�b~�O�[yڑ�r�(�l?���8}j�*X�����T�31P�-G~8;�A('[����%~	3��0B#�T����@
�W�G�`����f���PY���Ъ"��.%������s]4v� )�jj�66����=��Ŭ0��N	`��
D��@���^��v��F����G�.�R�d������+L3e������5MV���BNILEv�{�,Ǭ�L·`:���G/���#g��N$ E+"OR��-�c���`��Vyx�j4Y�I9w�9%UU%o�(��&�i��%�R�&,��OE�Y�*jL��r+|.S���r����٢*�au����'� +Y��p�gϮM�e����c�Ʋ��i�_pKd�C�5L���S�ZJ���BƀE
Ti2�o#���[QV̚Z3F𤐠y���5E�|?���H_���0�ߨ�DK�~,3��p��	����@���"9=�x��^��� �@�	fݒo�dhqi���49���X�1moW�,vĸʴ�%��T�~�
_~ꦘv����*wW�fZ�%j�X%i��L��;<:���_�����o�ܻ�A*��X�<�jӃ����aO�Eɥ���f��.���ϼ�W��U-�}b���Mx!:�~Q��\���+F�5( �R}��Ze�+�ڰ2��)�Fɏ�j!��.�������u`ds�t%r��+�v���h�2$�Ӻ	�ҭ��А,�Q�l��R7�g�D�1�}�fr �6b��DM�OUg�@؄PƜ�h�F^fu��Ao@]R�k\�""��PeFu���LaiX40��4h�O����� �h�i>X g�u�-��79D1���-Wg���H�jS?��i��T���4��u���n�P����Ļ��ᚨV��[�፥� 1�r�1��"A؇e��_?��	��[���ơn�B��#��J�̏7�@� e�`��*X饴hIb�2�m������2c��
 �WZ=3�l�;5B�*�����f�����-�u��	}�!t��K�Y�
ۖ�B}Fh   Gӗ�ߛ���6t���.��iݹ�i���Z�Ȭx"�tyWzO��H��N2욤��!KA�=�{��w���S�B�/֠eŦғ���MYm�k͜e�pF�'u�}7�GX��y#Uq��Y�A����"O�]t�n�����
��i������C�@�2�.�����1�:�Y�p���+�����n��B3jz��������Wd۵�US����*<���b>xX߶4�{z���b�
y����9/�`F�E��S���Uf�3�QQN��J���eO�#3_;4SF�g�`�~8�228%����#8(\qBd$��%\�tv��U<�za^���k%m|���fs�A���b�O�l� �Y����>3��A�9��!�3'��%�D�R�V/���W_ԁ[S�`-{��;�ag�a�;sy�Ȱ��ӑs��J��\Z��ٚ_\/ŽUm�m��r�PR��
� E&�#�Y�bL�[Mj�ɽ���	m6K^�n5�Mf
̥���w`�lH�/T���zO�d�%�O	�B{��M�U�"-�#ű����`8�l��/�Z�K�Kҿ)��rC��!�uU�h`���T�٫lI��׸VhF,h��:pN��U��F� \ 3���V��/HS�U'�p���������[L.�䲩�4���㢤{0�^��w���V�sU !+ ���L��Po�K��@7tt�j�X����5���� �(@! ��<�[�xFA�f�	���G�d"L߰@���a�M�d�H��ۅ�O[�ӕ����k�Iɑt�jq(���0tI�QT|��|�Ǚ������ywr�������m4?�1�ɐ�eJgw�ٹ���ߝ������]���/��m��6��?������y��~rb�ri�♱c9	Q����8
�� 	����Pwa���-�̉������{����p������x����W����a��A�[��岘�uO~���^�\zn>����t���im.���)����x��n����F��_[]�`��������X���Մ�{�G��흣�_��^��^m�>�t�o�}s���j������L����$�R�Vw��e�Օ"w[���t�L@W�a�v�>�1��N(���� :2�4�8�?:�ҽ7g݇-72�e	Svr�>}So�]��nK*�aq��_�mu(�Ow@�]k�����oS;(��/�P3����2��a� �%��ᙎ) �[E�z��LՍ��R8��Ey�@��Vbrk�l	�ܧl�N���V�C���O�
WP
���xR[�`3K8�if\��$��&]sV�8
Ћ@N�`�kw=���7��$kυ��[� r��2�J������#p���aXա\��#�w)�{�u�#����0 ʃ@�$"�d:W�C�PI�&�f��-��
���&Wm���d;�ӨH�z��
���������/�f�}�.��\PJZ[�9����hʱ@�דs֠�|�����LHd1�<Fe�	C�]�&r�^q7��J�]�Llh$rɨ9(�Z����:��I�+D)Q��~�����4�s�xD'��)�'2������ޛ}�W�һT�B�]O'�:��I-�2f[i����	�	ہN���Y�7>H��G}��U��LU䗥:�P��3�7��9�ͦ?��A�{����O���\k�������'l�|x�|���ڶQ��F���'�HQ��%��?�D%u�\�E&�֫.[i�^9�`W�n�fb�����Ig�:�����#���S�Z
�
�����\':����)Z��/3(�� DߥC���)�]�x�x$%��"9h3?������bޕ{|~&���Y��%�S/����Njp����D@�Xv�A�&ďNk�7���w�K֣�P�޽zu������7O(��ߗ��752K�}b�1ε��GM-����A^t�}�c��.wk�8�k������/��{�쓥��;ka�]�!��F9�����5QgX�D|7�QXu�
��ʻ [��";*�r�-�l��9��0�د�e[�m>*��w�:�T.��T���U�P[axmM+xF��hgM�X�U�A���-�����_�=!:6��5h`��)���¥��?K�.�\v���\]��@u1���{!9�Id)�2��t�[ wƸ���<)喟�!�
��O��3
�{u�1@kj�`�1Ȏ��v��T��P
8*� _S&m�4&)��'V���P��&Փ�>]��1,�H@�ŗ�A�_r��]+�ޖ����W�
v����)5w��[�q��3��le�@'q*�^h����H���wm����<��dkWM��F1v����3��
6D�TՉs��1���/]����QG~\	|�|�L�Ȳ���܀��z���l,ݡ�3GL9���L=0g�O���������o�,�G*&? Ul#��7ٌ*��+:Q�H�G���GP[���P�e�BV�ȭ�4ep)��V(ؠL�L���@�h�5��Ru�����S8Qfcf���Y��(�gM����I��Jn0[W��TZ��ʺ��D��h�������+��p�ęJ��N��E�hz��Y͢��Ͼ��(�_$ĭ)'ż�3Bs�S�{j�(ٱŐ�kp#��s�z�@�$�Z-��)�ݨ�pd7��w�5t\�3��(�ƀ������չ�p��3=U��"�9,��([N�gĹ?��<���(����ޢ��t���"�U�)0[�t���o�i�w�r�~����á�R���wE̬��i�F��6�X�Fv�VYЪ�a���z����P��Q�D�k|	����t0.0��u���'��{o�w[|���>XC�z�] R*}�����]{W�ƶ���O15�1Pd^y4�@r�7�,HnVWh]���-9��CK���~̌f$�@ i��Zm�4�Ǟ���޴qH���rف����(�jrˁ%�=�{t����ǘC-�0� �y���I8�Oe(c����m,AԹ9�O[����Rj�0��l�����F]t'lu����G�$V�wdL�@V���\]P�m�fc]|��+��W��.dzv5^���WR���/�� m���&����O��~T�܆���m�r�0��Q�&������vI�0�I�.��53������f���ѭ��J>3� i�l���d!wl�V�n��CXkc\Z	IkI�j���Q�H�n��6��T�����3��R���>y��اZm��OmQ�z
��H�G�vP�GCj㚽�j�h���uˡ,Qa�K9��~Ϧ��[���P(�vTK�S+�$ Lq�^��u��+���wt�FW4=|��ޝ����,��Ko��-��`��L�x%T_N��f�����P���[�N�س�sE���(�I����`+��7�։n��0>bY���[S�E��~8K��Vl��kُ`Z��w`ZQ|�&C���f_[&�
��"��͔I�o?�qc~CH��xL ��Q�\�,�n�bǺ�`�z���;5x*y	�kP�m��Ul��d��s�l�緮���g���u�Ό�d$Ǔ.��]�7ī)�<a���Z�xTˮ��P�-��l9����$`�5R��f�Je��hg���:�/^	<wb3O�����FO� 7�'�>����!�����0:�N�I�����D���Oqӥr�8A��'��G���j���J��a��@N���%r��J�y*�a�4�7���A.�͆w�c	�<kD�|�!��h��C�x���5sdZ����u���̲j�k���}*9��}F��������g����k�e��i�+��I��h�3���pH��H#w��0wI��[vhZ��-���9�t���)��lI���yū���\��=׺,Z;������M���^�OGۙR��( �%|��r��[��L����Y��uYO�
�Ҿ6�*r`�P����`�"��T��q�Oot��F�y�f{>��1�.d�)�ߑz��߮m�s����)[�tv^�w��pU�j�~��\�4�\��ᬂ:�Y�^,B���� ��g����_�R"hj@Z塐� ���x�}�r�`���
���Z�U�S�XK�N�~m��O�[+����\�P���f��3 �^�y��9�{�(��o;e�o80��U���FI#fLY{s��x�P��X�Q6��c�.��.��]��?��,$�r�:KW�H2wx�L��ǶV:J~�(�����7���3G�=���Vr	1�t9�ͨK���6Ag���MWh�s�o��WW�h��Q�]�dX�M����@%�۰>^@�5���:�J,�����	`�y)�[��|?	b�	!����c�*ұ.��ї�yZ�Oi��?Q ,�ϯ�=&�T��[f �ő�<�'��W��޹�%��ݼc7ܓ�R�k��eo���W?�Þ�K��}��uMy�x�� vuFEY_�P�h�,v�N
e?X�uڲ\J��!�B������ܿ�-���HmP�52+����z0�۴E��6;����b�����<�[1V���.ռ�I(N�E��.دo���PNER�D���	B�]�Ư��w��)�=��PB��Vۺ���꼇Ջm+��O��eZ𪌗�w_K�$�g����}��������*��y*�������o�����[�����V�k�����o�����[���������V#|V������ѕ�����y� ��<W��+O��'��p�	��\y�<W��+O��3��=�qM����r�߇����_������|9"ʁ �H ���{��:2�cD� 7#~_i��ڂ^��o6g/`.�6M�������m�NH&c �r���Q�z��O���ǐ���)˗xۼA<��@�xD����4���RET�?�t���p3�oX��Yj�uA@~��1sd:@�.'9��.�������`��h�W�5CZ��[�3ԬeY�9,�Vz(K��AW���EwV��A7n���?�<z��Աp�BΨ����B�x�: �\��EsC�Ej�ޏ/��r���{"�mw�@D�	��=Ϥ����؜]DPZ�����Q���5���j��i�u��7��s����S��/��/q�.^�����;��K/��Roϻ%b{j���UO	d������ַ
���
��e�
������G�S���������������z�&����(��%�������'�s12h�_��
����I3"zX#_B2���J��d�����A������IE��?��5�������7�n"�����и%���|�D{Z��P����-�j�O��OsU4ٯ�D�(�+�,G�X��]�~o(���)<taE�Y������7�a���5��fl�7��m���e��t�ny{7Я\�!�n�����f55�9o�?��s���[�jN� ��Ԥ7nRVa��v��~��5��ȣ޲zgl�"�͟&���{�3����a���'�z���05C�nW|���]�@���s�}�;l�j����5\�x������q�6�XZ"���8�I<���C������t$ۙ�}��9`��a��� �AI�_;������*�mtᒑ��)pȓX&e�ʥ�k0HP��V�9�E��8�d�_�O�#��W����S]���V�7�%�L��ow����eղ���i[����X�[�pf$I�����'�(I���� oy�ꥅpsM�-�!��@\���Ӝ�t�v���o�ίn���{a�Ċm�6��V�� q�|�Fu� ���E=��<Xú�M; Bt��Rr�ܮuH��1���g�u�k�4���O����:&��M��ɚ�����{]Åa��z�7��	)�f�:�e;K�|�u�����[����ڼ�����u�-۬y�X�(���K�(�D]�U� ;�wB�����T{<CX��}=2��=�w�۠d��ᆃ&���#�#�\i�Ü���&x��{m�*���?.�p2Xt�_@i��=�xO�f�"�o C|&
���3�V���|�v9���a�Pμ�����Zl�\7��#)>�u¡�I�����]Gf�\��&D��H��Dn�-����2J���f����D⧆Ӻ�Zޟ
���@o�����Ogyg��ܪ�������6����z_k�@�7ZwA�޺��P�w9��8(SWA����
W=7zJ�_����������fe��"Oe��쿕����V����[�+�oe��쿕����V����[�+�oe���/o.unTـ+pe�l����W6��\ـ��O���
��e��l������~���������#xi�A�~���+ c2��w�)�Q�j#���qO���!�,�4���/��@b�-���3�Ml0��O� ��u=T�?�`�y��L�F���z}Qp[���]���������)�--?��ث��]<?Y�XG��;�TiH�z�Η���,��}l���ǁ5�Х,
�/-��T���e{^3~�qߡn!K�,�J��6A���,�ߘ��B*e6"9���N7,/d����<����^o��l����R`���o<�`�.�3���i�t��'��%��q���Z�������
��EE�3꿨��x�G�?G�w�es��c�[;Uk���f�+$��E����~���)ez?�؂���$�F���`�r	{�jFx�i/Kg*cr�]SQN%�v�o ��%4E>���O��Ԏ�s�S ����������m�2�/��I�TE%���U͂�U
�^ʾ ���r�Q�M�����4E']�En�v����]9@IT��<�σ��@�YoZ,)  �=1�A��N-s\�(��+�v�*&N$~��0A�O��_���������w���G�P�no���<���<���%z�;��=�?�ɍG�z�FKRR0�Pm� ����+"DU��R��ө~*u1�!��R,�%�:4��5K�&����΋7{��:�jY$���՛v���J~����ۃ�;��>�@�k�3Y�:e5�jp�>�{u�y��b���F�]�*�Ȫ���(V�:FAGq�٬���9zs�!l�׶��ƱZމ�"�Ȍ���
I���(<��!s�*���$�]rR���!e?�􀉤������rfM��)f�ԧRH.������y�b�]^V,�j(��[�3.���9�I˧t�����������Y�OQ�s]a-ӷza�$�d��~��IR�����֡{Yp�͟�A�� ��pv`8-�;�<Y[�K`CK��^�>�6M��v��	��/�ح��^%� ]���~��-��M��r�g�_R�_3��~<�F�\ŉ���X�»ݒweUhj�ޑ�(zR�Y!u�MÓ���t=�{�����~Wh����"�����|U4��U����6�B��ؕ�F:m�<�:� i�G_�x��H$�J�ԀG��i'�.�~Ș�ۜ:��I�B958�d(�Xl�S�B�v���!��+�{x��K�K��2Si�<8VT�)�\��6���j�/���֗�e���+�!�����L�骢ѡ�z��T�#�3ɠaMa:Ft�%i��UL¡L��=����`(�ƀH]�C�|��I��Dx	t왮�;�񰌷n��v�ȜN��I�)EE:nqrBP��8����od0�7
/���{h�IQ/���/���H�:=Qg	�*�(�O�`\`�,�K����	��� �fed,G�T p�VR�<҄��?^��Z�L�k	-1����'MU�3Č-�U��m
���_�L����e�E��&���z�,�J����O$_��F���c�p(	�H��?P��+u<V������WM��#_Oq�D4AmQ͵�Miy�s�C*+��:��{d��f���!Po�m�:6��g�i�)໊E~��X �q4��cÑ-��߮�Ur�Š����l���e9�M8����{��������p�*7�Kl)RJ9�^�M�d�Q
���A������`��ʠ�mz��!QQ$Uh�I�>�.~f{�8.���@��]�S�t%i���H��DG�ۼ��TC���Z)���?Ma=��~��8���1��ǧ�h=��*Ht�e����Y�:��H �΋��(k�Ѷ�@�W1��B*b�3��pIŰJ�b!X-��7o��4�p��u���wR�F�oRd˜D.BQ!Y+V�{��$�AB1���O0@�%���VS٤��FW���-��_�]�ދs�l��*b4��""�D��9�`�2�6�!�4��&1@�$j�0����+��d�Kd��LbN�ڞ��W ��w���m���߄N���'�A� ������&��ﶉ�B&s���w�����`�l�a�5o
��jV2��È��Ak�4.d�q}������h�MF9<<���˧HYq�
�/f���k����oi�����b!�M^�P��J�ɕ�����]�z"�n&k'k����0�:Q�JaA4v�Jj�gc�1��
��%�X0��IyZ\i�,�������H�f�</nu��h�B偾'r�^�q��'�Yo������
p�M|�ؠ�-�-��iǨOs�6�{��H?������e��d����^�Kt �h��>*����U�?���.K!�JyL�(�j-	UE2ջ\4�L�b�B��Rx��_�G����x����kt*��ŕ��Dr�?{��!"��&�a� ?��*��GV6?�$�t2�Lsa���^_6R������	�.b`�!�WLUݜw��~g�����\��H�R	��uf[�W��.C�q+�&�78=�T�)l��п4�����Ǿ���&�`*���p�D���;-���t֫CV5]#��Pu8@�P���R�e��0�ņ=?eSAp	87`�I-����Q ln*��Fض$E�O)��
�D��Fkc�;-�nǓ�W��6��NM�.p,����)�;�߈�x)6��6����v���T�O��38��o9 ���J�윱��0 $�x���x�F�ށf�t�KB�۬��\�
��D˥ ĦIhߦ�R�2�
�m���Lxx�K����j��͑=��]Nš���.�Ah���l&���C���6�E(e?)��t�	��������������2�c��ƅ_ua��JG�%a��5 4�X����JzN[Ĉh(q�tҏœ~��$~�I鳁��l�W��n�l5X^�4�/]���O��� �/���뽧��v��B $���Adң(ծL��hL[�-q4M,X��;�F�|z�f5�Nm��kH�����<��m0ŧe�`L��r�=�H�E�ё&<-d���Qd�Ӎ��1��`�:Yv��Pu��<S����>������ 2=��^iV�(*݅3���x6[���'�	�X���4��sB�����+�/�|��)wv0kz�m�bۙ��{\�ٝ�O_����l#[���i��0Q�#89�K�K�� rZ��zQ����h
pU����H�O���`�E�Z݌jN��]1x�벇��MH$�?a{�����Iٯ�UQĊ=z`��ڪ6Zf7��b��Y�$j{���,sF� K�f^��e�v�ͪ$چ�)N�	EPׅb(O�8w3��/±�+蛙�^� V����2`��/h��3�pz��[跦���������γ�Ã�{��0
р��#\H�ӺM��eÓ[���`5'�����d'�*Z�w��oV���g���� �!�l�1��^�ԣ�k*�+�30 �]��>T��K[�YGb��00bC�.q�b4����'�6�66�W�t�,A� ٥���)R�����JAg�J�����-v����d�k��_p������rk�[��2T�u�[���(6��:�/Ae��0�g�a�	ߞ��.��H⤱ц�>����DYY"��Y���B-���u6|����mqLI��a.��6��4Kr�k���g�+G�+ S�����ѶUM� �� ?��S���;�I��T-�dT�V�@�{�$
��$'���jt��B�Bv�����N�-C
wG%�r�`ʝ�mg^܃���uFLrM�ͺj�j�A(5��3bT"�)i�(�W���s�0(��]�H��A��b����֗��ל+:-��X�$0⺜�f@�.Vd7٨��U��6�*�L������P��ĸ���@� ��l����kr��FLU�R�;��wC��]� �����:�9@iB�M�̸#�S��-c%�`{��`|h��"Wf�/�c	��c�P�s;Ư��I��w�8�(�C-���1&�:����2V��q�h+�o�pk6�m��hӷ#ʈH��F�hY�c�>?{�|X��vި���:��[qB'�zr&3���^�$��{�,��'㡒�n��x	�:w���Ic�c��/Tл�B���������(�ѩCt�_��@x@u����|U�a?��i`�H�X��ݖI�64X6�|
�M����ޙ2jI�E�-_4�f���̖r&~FUw�1f<L�w=�� N�O���|g5x��nw~�2^��m���v{RBa	�'���V�X��٤9�{��.I�w}�۶l;����V�t�0ba]�NnSxvW �û(��O��X�&!�VI"a&�2p�K��
��:�R;;a����!ø���U]V��AsV�P���꩞꩞꩞꩞꩞깿��P @ 