package types

// Standard is the initial map structure for unmarshaling YAML
type Standard map[string]interface{}

// NIST80053Standard is the adjusted map structure based on Standard
type NIST80053Standard map[string]ControlProperties

/*
// NIST80053Standard holds the properties that make up the OpenControl-formatted standard
type NIST80053Standard struct {

	// Access Control
	AC1    ControlProperties `yaml:"AC-1"`
	AC2    ControlProperties `yaml:"AC-2"`
	AC2_1  ControlProperties `yaml:"AC-2 (1)"`
	AC2_2  ControlProperties `yaml:"AC-2 (2)"`
	AC2_3  ControlProperties `yaml:"AC-2 (3)"`
	AC2_4  ControlProperties `yaml:"AC-2 (4)"`
	AC2_5  ControlProperties `yaml:"AC-2 (5)"`
	AC2_7  ControlProperties `yaml:"AC-2 (7)"`
	AC2_9  ControlProperties `yaml:"AC-2 (9)"`
	AC2_10 ControlProperties `yaml:"AC-2 (10)"`
	AC2_12 ControlProperties `yaml:"AC-2 (12)"`
	AC3    ControlProperties `yaml:"AC-3"`
	AC4    ControlProperties `yaml:"AC-4"`
	AC4_21 ControlProperties `yaml:"AC-4 (21)"`
	AC5    ControlProperties `yaml:"AC-5"`
	AC6    ControlProperties `yaml:"AC-6"`
	AC6_1  ControlProperties `yaml:"AC-6 (1)"`
	AC6_2  ControlProperties `yaml:"AC-6 (2)"`
	AC6_5  ControlProperties `yaml:"AC-6 (5)"`
	AC6_9  ControlProperties `yaml:"AC-6 (9)"`
	AC6_10 ControlProperties `yaml:"AC-6 (10)"`
	AC7    ControlProperties `yaml:"AC-7"`
	AC8    ControlProperties `yaml:"AC-8"`
	AC10   ControlProperties `yaml:"AC-10"`
	AC11   ControlProperties `yaml:"AC-11"`
	AC11_1 ControlProperties `yaml:"AC-11 (1)"`
	AC12   ControlProperties `yaml:"AC-12"`
	AC14   ControlProperties `yaml:"AC-14"`
	AC17   ControlProperties `yaml:"AC-17"`
	AC17_1 ControlProperties `yaml:"AC-17 (1)"`
	AC17_2 ControlProperties `yaml:"AC-17 (2)"`
	AC17_3 ControlProperties `yaml:"AC-17 (3)"`
	AC17_4 ControlProperties `yaml:"AC-17 (4)"`
	AC17_9 ControlProperties `yaml:"AC-17 (9)"`
	AC18   ControlProperties `yaml:"AC-18"`
	AC18_1 ControlProperties `yaml:"AC-18 (1)"`
	AC19   ControlProperties `yaml:"AC-19"`
	AC19_5 ControlProperties `yaml:"AC-19 (5)"`
	AC20   ControlProperties `yaml:"AC-20"`
	AC20_1 ControlProperties `yaml:"AC-20 (1)"`
	AC20_2 ControlProperties `yaml:"AC-20 (2)"`
	AC21   ControlProperties `yaml:"AC-21"`
	AC22   ControlProperties `yaml:"AC-22"`

	// Awareness and Training
	AT1   ControlProperties `yaml:"AT-1"`
	AT2   ControlProperties `yaml:"AT-2"`
	AT2_2 ControlProperties `yaml:"AT-2 (2)"`
	AT3   ControlProperties `yaml:"AT-3"`
	AT4   ControlProperties `yaml:"AT-4"`

	// Audit and Accountability
	AU1   ControlProperties `yaml:"AU-1"`
	AU2   ControlProperties `yaml:"AU-2"`
	AU2_3 ControlProperties `yaml:"AU-2 (3)"`
	AU3   ControlProperties `yaml:"AU-3"`
	AU3_1 ControlProperties `yaml:"AU-3 (1)"`
	AU4   ControlProperties `yaml:"AU-4"`
	AU5   ControlProperties `yaml:"AU-5"`
	AU6   ControlProperties `yaml:"AU-6"`
	AU6_1 ControlProperties `yaml:"AU-6 (1)"`
	AU6_3 ControlProperties `yaml:"AU-6 (3)"`
	AU7   ControlProperties `yaml:"AU-7"`
	AU7_1 ControlProperties `yaml:"AU-7 (1)"`
	AU8   ControlProperties `yaml:"AU-8"`
	AU8_1 ControlProperties `yaml:"AU-8 (1)"`
	AU9   ControlProperties `yaml:"AU-9"`
	AU9_2 ControlProperties `yaml:"AU-9 (2)"`
	AU9_4 ControlProperties `yaml:"AU-9 (4)"`
	AU11  ControlProperties `yaml:"AU-11"`
	AU12  ControlProperties `yaml:"AU-12"`

	// Security Assessment and Authorization
	CA1   ControlProperties `yaml:"CA-1"`
	CA2   ControlProperties `yaml:"CA-2"`
	CA2_1 ControlProperties `yaml:"CA-2 (1)"`
	CA2_2 ControlProperties `yaml:"CA-2 (2)"`
	CA2_3 ControlProperties `yaml:"CA-2 (3)"`
	CA3   ControlProperties `yaml:"CA-3"`
	CA3_3 ControlProperties `yaml:"CA-3 (3)"`
	CA3_5 ControlProperties `yaml:"CA-3 (5)"`
	CA5   ControlProperties `yaml:"CA-5"`
	CA6   ControlProperties `yaml:"CA-6"`
	CA7   ControlProperties `yaml:"CA-7"`
	CA7_1 ControlProperties `yaml:"CA-7 (1)"`
	CA8   ControlProperties `yaml:"CA-8"`
	CA8_1 ControlProperties `yaml:"CA-8 (1)"`
	CA9   ControlProperties `yaml:"CA-9"`

	// Configuration Management
	CM1    ControlProperties `yaml:"CM-1"`
	CM2    ControlProperties `yaml:"CM-2"`
	CM2_1  ControlProperties `yaml:"CM-2 (1)"`
	CM2_2  ControlProperties `yaml:"CM-2 (2)"`
	CM2_3  ControlProperties `yaml:"CM-2 (3)"`
	CM2_7  ControlProperties `yaml:"CM-2 (7)"`
	CM3    ControlProperties `yaml:"CM-3"`
	CM4    ControlProperties `yaml:"CM-4"`
	CM5    ControlProperties `yaml:"CM-5"`
	CM5_1  ControlProperties `yaml:"CM-5 (1)"`
	CM5_3  ControlProperties `yaml:"CM-5 (3)"`
	CM5_5  ControlProperties `yaml:"CM-5 (5)"`
	CM6    ControlProperties `yaml:"CM-6"`
	CM6_1  ControlProperties `yaml:"CM-6 (1)"`
	CM7    ControlProperties `yaml:"CM-7"`
	CM7_1  ControlProperties `yaml:"CM-7 (1)"`
	CM7_2  ControlProperties `yaml:"CM-7 (2)"`
	CM7_5  ControlProperties `yaml:"CM-7 (5)"`
	CM8    ControlProperties `yaml:"CM-8"`
	CM8_1  ControlProperties `yaml:"CM-8 (1)"`
	CM8_3  ControlProperties `yaml:"CM-8 (3)"`
	CM8_5  ControlProperties `yaml:"CM-8 (5)"`
	CM9    ControlProperties `yaml:"CM-9"`
	CM10   ControlProperties `yaml:"CM-10"`
	CM10_1 ControlProperties `yaml:"CM-10 (1)"`
	CM11   ControlProperties `yaml:"CM-11"`

	// Contingency Planning
	CP1    ControlProperties `yaml:"CP-1"`
	CP2    ControlProperties `yaml:"CP-2"`
	CP2_1  ControlProperties `yaml:"CP-2 (1)"`
	CP2_2  ControlProperties `yaml:"CP-2 (2)"`
	CP2_3  ControlProperties `yaml:"CP-2 (3)"`
	CP2_8  ControlProperties `yaml:"CP-2 (8)"`
	CP3    ControlProperties `yaml:"CP-3"`
	CP4    ControlProperties `yaml:"CP-4"`
	CP4_1  ControlProperties `yaml:"CP-4 (1)"`
	CP6    ControlProperties `yaml:"CP-6"`
	CP6_1  ControlProperties `yaml:"CP-6 (1)"`
	CP6_3  ControlProperties `yaml:"CP-6 (3)"`
	CP7    ControlProperties `yaml:"CP-7"`
	CP7_1  ControlProperties `yaml:"CP-7 (1)"`
	CP7_2  ControlProperties `yaml:"CP-7 (2)"`
	CP7_3  ControlProperties `yaml:"CP-7 (3)"`
	CP8    ControlProperties `yaml:"CP-8"`
	CP8_1  ControlProperties `yaml:"CP-8 (1)"`
	CP8_2  ControlProperties `yaml:"CP-8 (2)"`
	CP9    ControlProperties `yaml:"CP-9"`
	CP9_1  ControlProperties `yaml:"CP-9 (1)"`
	CP9_3  ControlProperties `yaml:"CP-9 (3)"`
	CP10   ControlProperties `yaml:"CP-10"`
	CP10_2 ControlProperties `yaml:"CP-10 (2)"`

	// Identification and Authentication
	IA1    ControlProperties `yaml:"IA-1"`
	IA2    ControlProperties `yaml:"IA-2"`
	IA2_1  ControlProperties `yaml:"IA-2 (1)"`
	IA2_2  ControlProperties `yaml:"IA-2 (2)"`
	IA2_3  ControlProperties `yaml:"IA-2 (3)"`
	IA2_5  ControlProperties `yaml:"IA-2 (5)"`
	IA2_8  ControlProperties `yaml:"IA-2 (8)"`
	IA2_11 ControlProperties `yaml:"IA-2 (11)"`
	IA2_12 ControlProperties `yaml:"IA-2 (12)"`
	IA3    ControlProperties `yaml:"IA-3"`
	IA4    ControlProperties `yaml:"IA-4"`
	IA4_4  ControlProperties `yaml:"IA-4 (4)"`
	IA5    ControlProperties `yaml:"IA-5"`
	IA5_1  ControlProperties `yaml:"IA-5 (1)"`
	IA5_2  ControlProperties `yaml:"IA-5 (2)"`
	IA5_3  ControlProperties `yaml:"IA-5 (3)"`
	IA5_4  ControlProperties `yaml:"IA-5 (4)"`
	IA5_6  ControlProperties `yaml:"IA-5 (6)"`
	IA5_7  ControlProperties `yaml:"IA-5 (7)"`
	IA5_11 ControlProperties `yaml:"IA-5 (11)"`
	IA6    ControlProperties `yaml:"IA-6"`
	IA7    ControlProperties `yaml:"IA-7"`
	IA8    ControlProperties `yaml:"IA-8"`
	IA8_1  ControlProperties `yaml:"IA-8 (1)"`
	IA8_2  ControlProperties `yaml:"IA-8 (2)"`
	IA8_3  ControlProperties `yaml:"IA-8 (3)"`
	IA8_4  ControlProperties `yaml:"IA-8 (4)"`

	// Incident Response
	IR1   ControlProperties `yaml:"IR-1"`
	IR2   ControlProperties `yaml:"IR-2"`
	IR3   ControlProperties `yaml:"IR-3"`
	IR3_2 ControlProperties `yaml:"IR-3 (2)"`
	IR4   ControlProperties `yaml:"IR-4"`
	IR4_1 ControlProperties `yaml:"IR-4 (1)"`
	IR5   ControlProperties `yaml:"IR-5"`
	IR6   ControlProperties `yaml:"IR-6"`
	IR6_1 ControlProperties `yaml:"IR-6 (1)"`
	IR7   ControlProperties `yaml:"IR-7"`
	IR7_1 ControlProperties `yaml:"IR-7 (1)"`
	IR7_2 ControlProperties `yaml:"IR-7 (2)"`
	IR8   ControlProperties `yaml:"IR-8"`
	IR9   ControlProperties `yaml:"IR-9"`
	IR9_1 ControlProperties `yaml:"IR-9 (1)"`
	IR9_2 ControlProperties `yaml:"IR-9 (2)"`
	IR9_3 ControlProperties `yaml:"IR-9 (3)"`
	IR9_4 ControlProperties `yaml:"IR-9 (4)"`

	// Maintenance
	MA1   ControlProperties `yaml:"MA-1"`
	MA2   ControlProperties `yaml:"MA-2"`
	MA3   ControlProperties `yaml:"MA-3"`
	MA3_1 ControlProperties `yaml:"MA-3 (1)"`
	MA3_2 ControlProperties `yaml:"MA-3 (2)"`
	MA3_3 ControlProperties `yaml:"MA-3 (3)"`
	MA4   ControlProperties `yaml:"MA-4"`
	MA4_2 ControlProperties `yaml:"MA-4 (2)"`
	MA5   ControlProperties `yaml:"MA-5"`
	MA5_1 ControlProperties `yaml:"MA-5 (1)"`
	MA6   ControlProperties `yaml:"MA-6"`

	// Media Protection
	MP1   ControlProperties `yaml:"MP-1"`
	MP2   ControlProperties `yaml:"MP-2"`
	MP3   ControlProperties `yaml:"MP-3"`
	MP4   ControlProperties `yaml:"MP-4"`
	MP5   ControlProperties `yaml:"MP-5"`
	MP5_4 ControlProperties `yaml:"MP-5 (4)"`
	MP6   ControlProperties `yaml:"MP-6"`
	MP6_2 ControlProperties `yaml:"MP-6 (2)"`
	MP7   ControlProperties `yaml:"MP-7"`
	MP7_1 ControlProperties `yaml:"MP-7 (1)"`

	// Physical and Environmental Protection
	PE1    ControlProperties `yaml:"PE-1"`
	PE2    ControlProperties `yaml:"PE-2"`
	PE3    ControlProperties `yaml:"PE-3"`
	PE4    ControlProperties `yaml:"PE-4"`
	PE5    ControlProperties `yaml:"PE-5"`
	PE6    ControlProperties `yaml:"PE-6"`
	PE6_1  ControlProperties `yaml:"PE-6 (1)"`
	PE8    ControlProperties `yaml:"PE-8"`
	PE9    ControlProperties `yaml:"PE-9"`
	PE10   ControlProperties `yaml:"PE-10"`
	PE11   ControlProperties `yaml:"PE-11"`
	PE12   ControlProperties `yaml:"PE-12"`
	PE13   ControlProperties `yaml:"PE-13"`
	PE13_2 ControlProperties `yaml:"PE-13 (2)"`
	PE13_3 ControlProperties `yaml:"PE-13 (3)"`
	PE14   ControlProperties `yaml:"PE-14"`
	PE14_2 ControlProperties `yaml:"PE-14 (2)"`
	PE15   ControlProperties `yaml:"PE-15"`
	PE16   ControlProperties `yaml:"PE-16"`
	PE17   ControlProperties `yaml:"PE-17"`

	// Planning
	PL1   ControlProperties `yaml:"PL-1"`
	PL2   ControlProperties `yaml:"PL-2"`
	PL2_3 ControlProperties `yaml:"PL-2 (3)"`
	PL4   ControlProperties `yaml:"PL-4"`
	PL4_1 ControlProperties `yaml:"PL-4 (1)"`
	PL8   ControlProperties `yaml:"PL-8"`

	// Personnel Security
	PS1   ControlProperties `yaml:"PS-1"`
	PS2   ControlProperties `yaml:"PS-2"`
	PS3   ControlProperties `yaml:"PS-3"`
	PS3_3 ControlProperties `yaml:"PS-3 (3)"`
	PS4   ControlProperties `yaml:"PS-4"`
	PS5   ControlProperties `yaml:"PS-5"`
	PS6   ControlProperties `yaml:"PS-6"`
	PS7   ControlProperties `yaml:"PS-7"`
	PS8   ControlProperties `yaml:"PS-8"`

	// Risk Assessment
	RA1   ControlProperties `yaml:"RA-1"`
	RA2   ControlProperties `yaml:"RA-2"`
	RA3   ControlProperties `yaml:"RA-3"`
	RA5   ControlProperties `yaml:"RA-5"`
	RA5_1 ControlProperties `yaml:"RA-5 (1)"`
	RA5_2 ControlProperties `yaml:"RA-5 (2)"`
	RA5_3 ControlProperties `yaml:"RA-5 (3)"`
	RA5_5 ControlProperties `yaml:"RA-5 (5)"`
	RA5_6 ControlProperties `yaml:"RA-5 (6)"`
	RA5_8 ControlProperties `yaml:"RA-5 (8)"`

	// System and Services Acquisition
	SA1    ControlProperties `yaml:"SA-1"`
	SA2    ControlProperties `yaml:"SA-2"`
	SA3    ControlProperties `yaml:"SA-3"`
	SA4    ControlProperties `yaml:"SA-4"`
	SA4_1  ControlProperties `yaml:"SA-4 (1)"`
	SA4_2  ControlProperties `yaml:"SA-4 (2)"`
	SA4_8  ControlProperties `yaml:"SA-4 (8)"`
	SA4_9  ControlProperties `yaml:"SA-4 (9)"`
	SA4_10 ControlProperties `yaml:"SA-4 (10)"`
	SA5    ControlProperties `yaml:"SA-5"`
	SA8    ControlProperties `yaml:"SA-8"`
	SA9    ControlProperties `yaml:"SA-9"`
	SA9_1  ControlProperties `yaml:"SA-9 (1)"`
	SA9_2  ControlProperties `yaml:"SA-9 (2)"`
	SA9_4  ControlProperties `yaml:"SA-9 (4)"`
	SA9_5  ControlProperties `yaml:"SA-9 (5)"`
	SA10   ControlProperties `yaml:"SA-10"`
	SA10_1 ControlProperties `yaml:"SA-10 (1)"`
	SA11   ControlProperties `yaml:"SA-11"`
	SA11_1 ControlProperties `yaml:"SA-11 (1)"`
	SA11_2 ControlProperties `yaml:"SA-11 (2)"`
	SA11_8 ControlProperties `yaml:"SA-11 (8)"`
	SA22   ControlProperties `yaml:"SA-22"`
	SA22_1 ControlProperties `yaml:"SA-22 (1)"`

	// System and Communications Protection
	SC1    ControlProperties `yaml:"SC-1"`
	SC2    ControlProperties `yaml:"SC-2"`
	SC4    ControlProperties `yaml:"SC-4"`
	SC5    ControlProperties `yaml:"SC-5"`
	SC6    ControlProperties `yaml:"SC-6"`
	SC7    ControlProperties `yaml:"SC-7"`
	SC7_12 ControlProperties `yaml:"SC-7 (12)"`
	SC7_13 ControlProperties `yaml:"SC-7 (13)"`
	SC7_18 ControlProperties `yaml:"SC-7 (18)"`
	SC7_3  ControlProperties `yaml:"SC-7 (3)"`
	SC7_4  ControlProperties `yaml:"SC-7 (4)"`
	SC7_5  ControlProperties `yaml:"SC-7 (5)"`
	SC7_7  ControlProperties `yaml:"SC-7 (7)"`
	SC7_8  ControlProperties `yaml:"SC-7 (8)"`
	SC8    ControlProperties `yaml:"SC-8"`
	SC8_1  ControlProperties `yaml:"SC-8 (1)"`
	SC10   ControlProperties `yaml:"SC-10"`
	SC12   ControlProperties `yaml:"SC-12"`
	SC12_1 ControlProperties `yaml:"SC-12 (1)"`
	SC12_2 ControlProperties `yaml:"SC-12 (2)"`
	SC12_3 ControlProperties `yaml:"SC-12 (3)"`
	SC13   ControlProperties `yaml:"SC-13"`
	SC15   ControlProperties `yaml:"SC-15"`
	SC17   ControlProperties `yaml:"SC-17"`
	SC18   ControlProperties `yaml:"SC-18"`
	SC19   ControlProperties `yaml:"SC-19"`
	SC20   ControlProperties `yaml:"SC-20"`
	SC21   ControlProperties `yaml:"SC-21"`
	SC22   ControlProperties `yaml:"SC-22"`
	SC23   ControlProperties `yaml:"SC-23"`
	SC28   ControlProperties `yaml:"SC-28"`
	SC28_1 ControlProperties `yaml:"SC-28 (1)"`
	SC39   ControlProperties `yaml:"SC-39"`

	// System and Information Integrity
	SI1    ControlProperties `yaml:"SI-1"`
	SI10   ControlProperties `yaml:"SI-10"`
	SI11   ControlProperties `yaml:"SI-11"`
	SI12   ControlProperties `yaml:"SI-12"`
	SI16   ControlProperties `yaml:"SI-16"`
	SI2    ControlProperties `yaml:"SI-2"`
	SI2_2  ControlProperties `yaml:"SI-2 (2)"`
	SI2_3  ControlProperties `yaml:"SI-2 (3)"`
	SI3    ControlProperties `yaml:"SI-3"`
	SI3_1  ControlProperties `yaml:"SI-3 (1)"`
	SI3_2  ControlProperties `yaml:"SI-3 (2)"`
	SI3_7  ControlProperties `yaml:"SI-3 (7)"`
	SI4    ControlProperties `yaml:"SI-4"`
	SI4_1  ControlProperties `yaml:"SI-4 (1)"`
	SI4_16 ControlProperties `yaml:"SI-4 (16)"`
	SI4_2  ControlProperties `yaml:"SI-4 (2)"`
	SI4_23 ControlProperties `yaml:"SI-4 (23)"`
	SI4_4  ControlProperties `yaml:"SI-4 (4)"`
	SI4_5  ControlProperties `yaml:"SI-4 (5)"`
	SI4_14 ControlProperties `yaml:"SI-4 (14)"`
	SI5    ControlProperties `yaml:"SI-5"`
	SI6    ControlProperties `yaml:"SI-6"`
	SI7    ControlProperties `yaml:"SI-7"`
	SI7_1  ControlProperties `yaml:"SI-7 (1)"`
	SI7_7  ControlProperties `yaml:"SI-7 (7)"`
	SI8    ControlProperties `yaml:"SI-8"`
	SI8_1  ControlProperties `yaml:"SI-8 (1)"`
	SI8_2  ControlProperties `yaml:"SI-8 (2)"`

	Name string `yaml:"name"`
}
*/

// ControlProperties hold the properties of each of the controls in the NIST 800-53 standard
type ControlProperties struct {
	ID          string
	Family      string `yaml:"family"`
	Name        string `yaml:"name"`
	Description string `yaml:"description"`
}
