import { v4 } from 'uuid'

class PartnerType {
  id: string
  name: string

  constructor(props: Omit<PartnerType, 'id'>, id?: string) {
    Object.assign(this, props)

    if (!id) {
      this.id = v4()
    }
  }
}

export { PartnerType }
