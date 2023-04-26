import { v4 } from 'uuid'

class Region {
  id: string
  name: string

  constructor(props: Omit<Region, 'id'>, id?: string) {
    Object.assign(this, props)

    if (!id) {
      this.id = v4()
    }
  }
}

export { Region }
