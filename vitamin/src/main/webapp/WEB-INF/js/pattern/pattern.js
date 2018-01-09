class Pattern {
	constructor(id, pettern, msg, sameCheck = -1)
	{
		this.id = id;
		this.pettern = pettern;
		this.msg = msg;
		this.sameCheck = sameCheck;
	}
	
	matches() {
		return this.pettern.test(this.id.val());
	};
	
	static searchTarget(ptns, iPtn) {
		let ptnEx = new Array();
		let cPtnEx = new Array();
		
		if(iPtn != undefined) {
			cPtnEx.push(iPtn);
		}
		
		for(let i = 0; i < ptns.length; i++) {
			if(ptns[i].sameCheck != -1) {
				ptnEx.push(ptns[i]);
			}
		}
		if(cPtnEx.length == 0) { cPtnEx = ptnEx; }
		
		for(let tPtn of ptnEx) {
			if(tPtn.sameCheck.target == true) {
				let code = tPtn.sameCheck.code;
				
				for(let cPtn of cPtnEx) {
					if(cPtn.sameCheck.code == tPtn.sameCheck.code) {
						if(cPtn.sameCheck.target == false) {
							if(cPtn.id.val() != tPtn.id.val()) {
								throw {'ptn':cPtn, 'code': 2, 'msg': tPtn.sameCheck.msg};
							}
						}
					}
				}
			}
		}
	};
};