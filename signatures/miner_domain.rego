package tracker.TRC_1002
import data.tracker.helpers

__rego_metadoc__ := {
	"id": "TRC_1002",
	"version": "0.1.0",
	"name": "miner_domain",
	"eventName": "miner_domain",
	"description": "Check for commom cryptominers domains access",
}

tracker_selected_events[eventSelector] {
	eventSelector := {
		"source": "tracker",
		"name": "net_packet_dns_request",
	}
}

domains := [
	"asia1.ethpool.org",
	"ca.minexmr.com",
	"cn.stratum.slushpool.com",
	"de.minexmr.com",
	"eth-ar.dwarfpool.com",
	"eth-asia.dwarfpool.com",
	"eth-asia1.nanopool.org",
	"eth-au.dwarfpool.com",
	"eth-au1.nanopool.org",
	"eth-br.dwarfpool.com",
	"eth-cn.dwarfpool.com",
	"eth-cn2.dwarfpool.com",
	"eth-eu.dwarfpool.com",
	"eth-eu1.nanopool.org",
	"eth-eu2.nanopool.org",
	"eth-hk.dwarfpool.com",
	"eth-jp1.nanopool.org",
	"eth-ru.dwarfpool.com",
	"eth-ru2.dwarfpool.com",
	"eth-sg.dwarfpool.com",
	"eth-us-east1.nanopool.org",
	"eth-us-west1.nanopool.org",
	"eth-us.dwarfpool.com",
	"eth-us2.dwarfpool.com",
	"eu.stratum.slushpool.com",
	"eu1.ethermine.org",
	"eu1.ethpool.org",
	"fr.minexmr.com",
	"mine.moneropool.com",
	"mine.xmrpool.net",
	"pool.minexmr.com",
	"pool.monero.hashvault.pro",
	"pool.supportxmr.com",
	"sg.minexmr.com",
	"sg.stratum.slushpool.com",
	"stratum-eth.antpool.com",
	"stratum-ltc.antpool.com",
	"stratum-zec.antpool.com",
	"stratum.antpool.com",
	"us-east.stratum.slushpool.com",
	"us1.ethermine.org",
	"us1.ethpool.org",
	"us2.ethermine.org",
	"us2.ethpool.org",
	"xmr-asia1.nanopool.org",
	"xmr-au1.nanopool.org",
	"xmr-eu1.nanopool.org",
	"xmr-eu2.nanopool.org",
	"xmr-jp1.nanopool.org",
	"xmr-us-east1.nanopool.org",
	"xmr-us-west1.nanopool.org",
	"xmr.crypto-pool.fr",
	"xmr.pool.minergate.com", 
	"rx.unmineable.com",
	"ss.antpool.com",
	"dash.antpool.com",
	"eth.antpool.com",
	"zec.antpool.com",
	"xmc.antpool.com",
	"btm.antpool.com",
	"stratum-dash.antpool.com",
	"stratum-xmc.antpool.com",
	"stratum-btm.antpool.com",
	"ca.minexmr.com",
	"cn.stratum.slushpool.com",
	"de.minexmr.com",
	"fr.minexmr.com",
	"mine.moneropool.com",
	"mine.xmrpool.net",
	"pool.minexmr.com",
	"sg.minexmr.com",
	"stratum-eth.antpool.com",
	"stratum-ltc.antpool.com",
	"stratum-zec.antpool.com",
	"stratum.antpool.com",
	"xmr.crypto-pool.fr",
	"ss.antpool.com",
	"stratum-dash.antpool.com",
	"stratum-xmc.antpool.com",
	"stratum-btm.antpool.com",
	"btm.antpool.com",
	"ca.minexmr.com",
	"de.minexmr.com",
	"fr.minexmr.com",
	"mine.moneropool.com",
	"mine.xmrpool.net",
	"pool.minexmr.com",
	"sg.minexmr.com",
	"xmr.crypto-pool.fr",
	"xmr.metal3d.org"
]

tracker_match {
	input.eventName == "net_packet_dns_request"
	dns_questions := helpers.get_tracker_argument("dns_questions")
	domains[_] = dns_questions[_].query
}
