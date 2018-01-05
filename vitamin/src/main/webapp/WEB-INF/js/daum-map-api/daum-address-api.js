
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullAddr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                fullAddr = data.roadAddress;

            } else {
                fullAddr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById('sample6_sigunguCode').value = data.sigunguCode;
            document.getElementById('sample6_address').value = fullAddr;
            document.getElementById('sample6_address2').focus();
            
            
        }
    }).open();
}